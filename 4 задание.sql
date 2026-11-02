INSERT INTO lab_ponedelnik_2para
SELECT t.nomer_labaratoriy, t.disciplina, t.den_nedeli, t.nomer_pari, t.nomer_gryppi
FROM raspisanie1 t
WHERE t.nomer_gryppi LIKE '1%';