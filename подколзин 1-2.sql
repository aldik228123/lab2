SELECT DISTINCT nomer_labaratoriy
FROM raspisanie
WHERE den_nedeli =  'Понедельник' --;
 AND nomer_pari = 2;

SELECT DISTINCT g.nomer_gryppi
FROM gryppi g
JOIN raspisanie r ON g.nomer_gryppi = r.nomer_gryppi
WHERE r.nomer_labaratoriy = '106'
 AND r.den_nedeli = 'Среда'
 AND g.nomer_gryppi LIKE '2%';