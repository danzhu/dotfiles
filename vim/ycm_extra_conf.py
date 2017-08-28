# Copyright (C) 2014 Google Inc.
#
# This file is part of ycmd.
#
# ycmd is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# ycmd is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with ycmd.  If not, see <http://www.gnu.org/licenses/>.

import os
import pathlib
import glob
import ycm_core


HDR_EXTS = ['.h', '.hpp', '.hh', '.hxx']
CXX_EXTS = ['.cc', '.cpp', '.cxx', '.c']
SRC_DIRS = ['src', 'lib', '']


FLAGS = [
    '-Wall',
    '-Wextra',
    '-Wno-unused-parameter',
    '-fexceptions',
    '-DDEBUG',
    '-std=c++14',
    '-x',
    'c++',
]


def sys_flags():
    flags = [
        '-isystem',
        '/usr/include',
        '-isystem',
        '/usr/local/include',
    ]

    dirs = glob.glob('/usr/include/c++/*')
    if len(dirs) > 0:
        # use newest version
        flags.extend(['-isystem', next(reversed(sorted(dirs)))])

    return flags


SYS_FLAGS = sys_flags()


def find_root():
    root = pathlib.Path.cwd()
    # find dir with compile_commands, but ignore CMake build dir
    while not (root / 'compile_commands.json').exists() or \
            (root / 'CMakeCache.txt').exists():
        new_root = root.parent.resolve()
        if new_root == root:
            # not found
            return pathlib.Path.cwd(), None

        root = new_root

    return root, ycm_core.CompilationDatabase(str(root))


ROOT, DATABASE = find_root()


def resolve_paths(flags, working_directory):
    if not working_directory:
        return list(flags)

    new_flags = []
    make_next_absolute = False
    path_flags = ['-isystem', '-I', '-iquote', '--sysroot=']

    for flag in flags:
        new_flag = flag

        if make_next_absolute:
            make_next_absolute = False
            if not flag.startswith('/'):
                new_flag = os.path.join(working_directory, flag)

        for path_flag in path_flags:
            if flag == path_flag:
                make_next_absolute = True
                break

            if flag.startswith(path_flag):
                path = flag[len(path_flag):]
                new_flag = path_flag + os.path.join(working_directory, path)
                break

        if new_flag:
            new_flags.append(new_flag)

    return new_flags


def try_database(filename):
    if not filename.exists():
        return None

    info = DATABASE.GetCompilationInfoForFile(str(filename))
    if not info.compiler_flags_:
        return None

    return info


def try_extension(filename, ext):
    # search in same directory
    info = try_database(filename)
    if info:
        return info

    # search in source directory
    for src_dir in SRC_DIRS:
        src = ROOT / src_dir

        if not src.exists():
            continue

        parts = filename.parts
        if 'include' in parts:
            idx = parts.index('include')

            # strip project name
            if idx < len(parts) - 2:
                rel = pathlib.Path(*parts[idx + 2:])
            else:
                rel = pathlib.Path(*parts[idx + 1:])

            info = try_database(src / rel)
            if info:
                return info

    return None


def try_random(ext):
    for src_dir in SRC_DIRS:
        src = ROOT / src_dir

        if not src.exists():
            continue

        # random file in source directory
        for random_file in src.rglob('*' + ext):
            info = try_database(random_file)
            if info:
                return info

    return None


def get_info(filename):
    # use existing info if available
    info = try_database(filename)
    if info:
        return info

    # try each C++ source extension
    for ext in CXX_EXTS:
        # if header file
        if filename.suffix in HDR_EXTS:
            info = try_extension(filename.with_suffix(ext), ext)
            if info:
                return info

        # try random source files
        info = try_random(ext)
        if info:
            return info

    # there's nothing we can do now :(
    return None


def FlagsForFile(filename, **kwargs):
    if not DATABASE:
        return {'flags': FLAGS + SYS_FLAGS}

    info = get_info(pathlib.Path(filename))
    if info:
        flags = resolve_paths(info.compiler_flags_, info.compiler_working_dir_)
        return {'flags': flags + SYS_FLAGS}

    return None
