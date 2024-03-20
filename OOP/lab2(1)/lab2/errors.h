#ifndef LAB2_ERRORS_H
#define LAB2_ERRORS_H

#include <errno.h>

#define IS_ERROR(error) (errno==error)  // verific daca am aruncat o eroare cu errno
#define SET_ERROR(error) (errno=error) // setez o eroare
#define CLEAR_ERRORS (errno=0)        // curat erorile setate
#define OUT_OF_RANGE 0xf1            // eroare la depasirea index-ului in vector
#define INSUFFICIENT_CAPACITY 0xf2  // eroare la depasirea capacitatii
#define NOT_FOUND -0xa1            // eroare pebtru un element care nu a putut fi gasit
#define SUCCESS 0                 // fara erori
#endif //LAB2_ERRORS_H
