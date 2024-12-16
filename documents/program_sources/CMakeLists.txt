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
    src/code/calibration/sensor_calibration.py.tex
    src/code/calibration/tool_calibration.py.tex

    src/code/execution/exec_trajectory.py.tex

    src/code/generation/gen_trajectory_friction.py.tex
    src/code/generation/gen_trajectory_fourier.py.tex

    src/code/identification/friction.py.tex
    src/code/identification/full.py.tex
    
    src/code/verification/fs_verification.py.tex
    src/code/verification/torques_verification.py.tex
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