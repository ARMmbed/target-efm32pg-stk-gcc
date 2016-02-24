# Copyright (C) 2014 ARM Limited. All rights reserved.

if(TARGET_EFM32PG_STK_GCC_TOOLCHAIN_INCLUDED)
    return()
endif()
set(TARGET_EFM32PG_STK_GCC_TOOLCHAIN_INCLUDED 1)

# provide compatibility definitions for compiling with this target: these are
# definitions that legacy code assumes will be defined. Before adding something
# here, think VERY CAREFULLY if you can't change anywhere that relies on the
# definition that you're about to add to rely on the TARGET_LIKE_XXX
# definitions that yotta provides based on the target.json file.
#
add_definitions("-DEFM32PG1B200F256GM48 -DEFM32PG -DEFM32 -DARM_MATH_CM4")

# append non-generic flags, and set EFM32PG-specific link script

set(_CPU_COMPILATION_OPTIONS "-mcpu=cortex-m4 -mthumb -D__thumb2__")

set(CMAKE_C_FLAGS_INIT             "${CMAKE_C_FLAGS_INIT} ${_CPU_COMPILATION_OPTIONS}")
set(CMAKE_ASM_FLAGS_INIT           "${CMAKE_ASM_FLAGS_INIT} ${_CPU_COMPILATION_OPTIONS}")
set(CMAKE_CXX_FLAGS_INIT           "${CMAKE_CXX_FLAGS_INIT} ${_CPU_COMPILATION_OPTIONS}")
set(CMAKE_MODULE_LINKER_FLAGS_INIT "${CMAKE_MODULE_LINKER_FLAGS_INIT} -mcpu=cortex-m4 -mthumb")
set(CMAKE_EXE_LINKER_FLAGS_INIT    "${CMAKE_EXE_LINKER_FLAGS_INIT} -mcpu=cortex-m4 -mthumb -T\"${CMAKE_CURRENT_LIST_DIR}/../ld/efm32pg1b.ld\"")