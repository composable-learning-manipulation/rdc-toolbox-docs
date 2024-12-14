CMAKE_MINIMUM_REQUIRED(VERSION 3.7)
PROJECT(program_sources)
FIND_PACKAGE(LATEX)
SET(PDFLATEX_COMPILER xelatex)
SET(LATEX_DEFAULT_BUILD pdf)
#SET(LATEX_OUTPUT_PATH build)
INCLUDE(../../UseLATEX.cmake)

# Основной документ:
SET(parts
    ../espd.cls # Класс настроек ЕСПД
    ../preamble.tex
    ../algo.tex
    src/аннотация.tex
    # src/листинг.tex
    src/code/mcu-libs/Matrix.h.tex
    src/code/mcu-libs/Matrix.cpp.tex
    src/code/mcu-libs/RLS.h.tex
    src/code/mcu-libs/RLS.cpp.tex
    
    src/code/dsp_rfft_windowed.cpp.tex
    src/code/dsp_rfft_windowed.h.tex
    src/code/dsp_setup.cpp.tex
    src/code/dsp_setup.h.tex
    src/code/sensor_self_diagnostic.cpp.tex
    src/code/sensor_self_diagnostic.h.tex
)
ADD_LATEX_DOCUMENT(
    program_sources.tex
    BIBFILES bibliography.bib
    IMAGE_DIRS images
    INPUTS ${parts}
)

add_custom_command(
        TARGET program_sources
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/program_sources/program_sources.pdf
                ${CMAKE_SOURCE_DIR}/output/текст_программы.pdf)

# Лист утверждения отдельно:
SET(parts_lu
    ../espd.cls
    ../preamble.tex
)

ADD_LATEX_DOCUMENT(
    program_sources_lu.tex
    INPUTS ${parts_lu}
)

add_custom_command(
        TARGET program_sources
        COMMAND ${CMAKE_COMMAND} -E copy
                ${CMAKE_SOURCE_DIR}/build/documents/program_sources/program_sources_lu.pdf
                ${CMAKE_SOURCE_DIR}/output/ЛУ/Никифоров/текст_программы_лу.pdf)