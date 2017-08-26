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
import glob
import ycm_core


CXX_EXTS = ['.cc', '.cpp', '.cxx']
SRC_DIRS = ['src', 'source', '']


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


def find_db():
    if os.path.exists('compile_commands.json'):
        return ycm_core.CompilationDatabase(os.getcwd())

    for globbed in glob.glob('*/compile_commands.json'):
        db_file = os.path.join(os.getcwd(), globbed)
        directory = os.path.dirname(db_file)

        if os.path.exists(directory):
            return ycm_core.CompilationDatabase(directory)

    return None


database = find_db()


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


def try_get_info(filename):
    if not os.path.exists(filename):
        return None

    compilation_info = database.GetCompilationInfoForFile(filename)
    if not compilation_info.compiler_flags_:
        return None

    return compilation_info


def get_info(filename):
    # use existing info if available
    info = try_get_info(filename)
    if info:
        return try_get_info(filename)

    # it's either a header file, or newly created source

    base_path = os.path.splitext(filename)[0]

    # try each C++ source extension
    for ext in CXX_EXTS:
        name = base_path + ext

        # search in same directory
        info = try_get_info(name)
        if info:
            return info

        basename = os.path.basename(name)

        # search in source directory
        for src_dir in SRC_DIRS:
            src = os.path.join(os.getcwd(), src_dir)

            # file with same basename
            info = try_get_info(os.path.join(src, basename))
            if info:
                return info

            # random file in source directory
            for random_file in glob.glob(src + '/*' + ext):
                info = try_get_info(random_file)
                if info:
                    return info

    # there's nothing we can do now :(
    return None


def FlagsForFile(filename, **kwargs):
    if not database:
        return {'flags': FLAGS + SYS_FLAGS}

    info = get_info(filename)
    if info:
        flags = resolve_paths(info.compiler_flags_, info.compiler_working_dir_)
        return {'flags': flags + SYS_FLAGS}

    return None
