#include "OfertaRepoFis.h"

void OfertaRepoFis::addOferta(const Oferta& o){
    OfertaRepo::addOferta(o);
    save_file();
}

void OfertaRepoFis::modOferta(const std::string &denumire, const Oferta &OfertaNoua) {
    OfertaRepo::modOferta(denumire, OfertaNoua);
    save_file();
}

void OfertaRepoFis::popOferta(const std::string &denumire) {
    OfertaRepo::popOferta(denumire);
    save_file();
}

void OfertaRepoFis::save_file() {
    std::ofstream out(this->nume_fisier);
    if(!out.is_open()){
        throw OfertaRepoException("Nu s-a putut deschide fisierul!\n");
    }
    for(const Oferta& oferta : getAll()){
        out << oferta.getDenumire() << "," << oferta.getDestinatie() << "," << oferta.getTip() << "," << oferta.getPret() << "\n";
    }
    out.close();
}

void OfertaRepoFis::load_file() {
    std::ifstream input;
    input.open(this->nume_fisier);
    if(input.is_open()){
        this->all.clear();
        std::string line;
        while(std::getline(input,line)){
            std::stringstream ss(line);
            std::string denumire, destinatie, tip;
            int pret;
            std::getline(ss, denumire, ',');
            std::getline(ss, destinatie, ',');
            std::getline(ss, tip, ',');
            ss >> pret;
            Oferta const oferta(denumire, destinatie, tip, pret);
            this->all.push_back(oferta);
        }
        input.close();
    }
    else
        throw OfertaRepoException("Nu s-a putut deschide fisierul!\n");

}


