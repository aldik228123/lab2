CREATE TABLE lab_ponedelnik_2para AS
SELECT r.*, g.max_kolvo_lydey, g.kyrator_gryppi
FROM raspisanie r
JOIN gryppi g ON r.nomer_gryppi = g.nomer_gryppi
WHERE r.nomer_labaratoriy IN (
    SELECT nomer_labaratoriy
	FROM raspisanie
	WHERE den_nedeli = 'Понедельник'
AND nomer_pari = 2
)