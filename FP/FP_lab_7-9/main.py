from business.service_persoane import *
from business.service_evenimente import *
from persistenta.repository_persoane import *
from persistenta.repository_evenimente import *
from prezentare.consola import *
from testare.teste_persoane import *
from testare.teste_evenimente import *
from validare.validatori_persoane import *
from validare.validatori_evenimente import *
from testare.teste_inscrieri import *
from persistenta.repository_inscrieri_file import *
from persistenta.repository_persoane_file import *
from persistenta.repository_evenimente_file import *

if __name__ == '__main__':
    teste1 = TestePersoane()
    teste1.ruleaza_toate_testele()
    teste2 = TesteEvenimente()
    teste2.ruleaza_toate_testele()
    teste3 = TesteInscrieri()
    teste3.ruleaza_toate_testele()
    print("Alegeti modul de import de date: 0 = de la tastatura 1 = din fisiere")
    isFile = int(input(">>>"))
    if isFile == 0:
        validator_persoana = ValidatorPersoane()
        repo_persoane = RepoPersoane()
        service_persoana = ServicePersoane(repo_persoane, validator_persoana)
        validator_eveniment = ValidatorEvenimente()
        repo_evenimente = RepoEvenimente()
        service_eveniment = ServiceEvenimente(repo_evenimente, validator_eveniment)
        repo_inscrieri = RepoInscrieri()
        service_inscrieri = ServiceInscrieri(repo_inscrieri, repo_evenimente, repo_persoane)
        consola = UI(service_persoana, service_eveniment, service_inscrieri, isFile)
    else:
        validator_persoana = ValidatorPersoane()
        repo_persoane = persoanaFileRepository()
        service_persoana = ServicePersoane(repo_persoane, validator_persoana)
        validator_eveniment = ValidatorEvenimente()
        repo_evenimente = evenimentFileRepository()
        service_eveniment = ServiceEvenimente(repo_evenimente, validator_eveniment)
        repo_inscrieri = inscrieriFileRepository()
        service_inscrieri = ServiceInscrieri(repo_inscrieri, repo_evenimente, repo_persoane)
        consola = UI(service_persoana, service_eveniment, service_inscrieri, isFile)
    consola.run()
