#pragma onceonce
#include "Oferta.h"
#include "OfertaRepo.h"

class ActiuneUndo{
public:
    virtual void doUndo() = 0;
    virtual ~ActiuneUndo() = default;
};

class UndoAdauga : public ActiuneUndo {
    Oferta ofertaAdaugata;
    Repo* rep;
public:
    UndoAdauga(Repo* rep, const Oferta& o):rep{rep}, ofertaAdaugata{o}{}

    void doUndo() override {
        rep->popOferta(ofertaAdaugata.getDenumire());
    }
};

class UndoSterge : public ActiuneUndo {
    Oferta ofertaSters;
    Repo* rep;
public:
    UndoSterge(Repo* rep, const Oferta&o):rep{rep},ofertaSters{o}{}
    void doUndo() override{
        rep->addOferta(ofertaSters);
    }
};

class UndoModifica : public  ActiuneUndo{
    Oferta ofertaMod;
    Repo* rep;
public:
    UndoModifica(Repo* rep, const Oferta& o):rep{rep}, ofertaMod{o}{}
    void doUndo() override{
        rep->modOferta(ofertaMod.getDenumire(), ofertaMod);
    }
};