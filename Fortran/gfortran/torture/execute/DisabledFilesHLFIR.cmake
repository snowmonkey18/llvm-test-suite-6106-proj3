#===------------------------------------------------------------------------===#
#
# Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
#
#===------------------------------------------------------------------------===#

# These tests are disabled because they fail at runtime when they should pass.
file(GLOB FAILING_FILES CONFIGURE_DEPENDS
  constructor.f90
  getarg_1.f90
)
