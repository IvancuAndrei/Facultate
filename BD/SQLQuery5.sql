USE [Jocuri Video]

SELECT DISTINCT c.nume  FROM Reviews r
JOIN Cumparatori c on r.id_cumparator = c.id_cumparator;

SELECT DISTINCT j.nume from Reviews r
JOIN Jocuri_Video j on r.id_joc = j.id_joc;

SELECT g.id_gen, g.nume, COUNT(gj.id_joc) nr_jocuri FROM Genuri g 
JOIN Genuri_Jocuri gj ON g.id_gen = gj.id_gen
JOIN Jocuri_Video j on j.id_joc = gj.id_joc
GROUP BY g.id_gen, g.nume
HAVING COUNT(gj.id_joc) >= 3;

SELECT j.nume, AVG(r.numar_stele) rating FROM Jocuri_Video j, Reviews r 
WHERE j.id_joc = r.id_joc
GROUP BY j.id_joc, j.nume
HAVING AVG(r.numar_stele) > 4;

SELECT e.nume,	COUNT(ae.id_angajat) nr_angajati FROM Echipe e
JOIN Angajat_Echipa ae ON e.id_echipa = ae.id_echipa
JOIN Angajati a ON a.id_angajat = ae.id_angajat
GROUP BY e.id_echipa, e.nume;

SELECT c.nume, c.prenume, j.nume FROM Cumparatori c, Jocuri_Video j, Joc__cumparator jc
WHERE c.id_cumparator = jc.id_cumparator AND j.id_joc = jc.id_joc;

SELECT a.nume, a.prenume, e.nume FROM Angajati a, Echipe e, Angajat_Echipa ae
WHERE a.id_angajat = ae.id_angajat AND e.id_echipa = ae.id_echipa;

SELECT j.nume, e.nume FROM Jocuri_Video j, Echipa_Joc ej, Echipe e
WHERE j.id_joc = ej.id_joc AND e.id_echipa = ej.id_echipa;

SELECT a.nume, a.prenume, j.nume FROM Jocuri_Video j, Angajati a, Angajat_Echipa ae, Echipe e, Echipa_Joc ej
WHERE e.id_echipa = ae.id_echipa AND a.id_angajat = ae.id_angajat AND j.id_joc = ej.id_joc AND e.id_echipa = ej.id_echipa;

SELECT f.nume, COUNT(DISTINCT ae.id_echipa) numar_echipe FROM Firme f
JOIN Angajati a ON f.id_firma = a.id_firma
JOIN Angajat_Echipa AE ON aE.id_angajat = a.id_angajat
GROUP BY f.nume;
