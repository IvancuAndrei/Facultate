cmake_minimum_required(VERSION 3.22.1)
project(Lab_2_4 C)

set(CMAKE_C_STANDARD 23)

add_executable(Lab_2_4 main.c oferta.h ofertaRepo.c ofertaRepo.h ofertaService.c ofertaService.h ui.c ui.h  testOfertaRepo.c testOfertaRepo.h testOfertaService.c testOfertaService.h listaOferte.h oferta.c listaOferte.c)
