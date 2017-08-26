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


HDR_EXTS = ['.h', '.hxx', '.hpp', '.hh']
CXX_EXTS = ['.cc', '.cpp', '.cxx', '.c', '.m', '.mm']
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
    '-isystem',
    '/usr/include',
    '-isystem',
    '/usr/local/include',
]


def find_db():
    dbs = glob.glob('*/compile_commands.json')
    if len(dbs) == 0:
        return None

    db_file = os.path.join(os.getcwd(), dbs[0])
    directory = os.path.dirname(db_file)

    if not os.path.exists(directory):
        return None

    return ycm_core.CompilationDatabase(directory)


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
        return { 'flags': FLAGS }

    info = get_info(filename)
    if info:
        flags = resolve_paths(info.compiler_flags_, info.compiler_working_dir_)
        return { 'flags': flags }

    return None


database = find_db()
