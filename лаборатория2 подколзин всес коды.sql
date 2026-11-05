--- 1. Выбрать лаборатории, которые заняты по понедельникам 2 парой.
SELECT DISTINCT nomer_labaratoriy
FROM raspisanie
WHERE den_nedeli =  'Понедельник' --;
 AND nomer_pari = 2;
--- 2. Выбрать группы 2 курса, которые занимаются в 106 лаборатории по средам.
SELECT DISTINCT g.nomer_gryppi
FROM gryppi g
JOIN raspisanie r ON g.nomer_gryppi = r.nomer_gryppi
WHERE r.nomer_labaratoriy = '106'
 AND r.den_nedeli = 'Среда'
 AND g.nomer_gryppi LIKE '2%';
--- 3. Создать таблицу, содержащую данные 1 запроса с указанием всех данных таблицы "расписание" и групп, которыми будут заняты лаборатории.
CREATE TABLE lab_ponedelnik_2para AS
SELECT r.*, g.max_kolvo_lydey, g.kyrator_gryppi
FROM raspisanie r
JOIN gryppi g ON r.nomer_gryppi = g.nomer_gryppi
WHERE r.nomer_labaratoriy IN (
    SELECT nomer_labaratoriy
	FROM raspisanie
	WHERE den_nedeli = 'Понедельник'
)
AND nomer_pari = 2;
--- 4. В созданную таблицу, добавить расписание занятий всех групп первого курса.
INSERT INTO lab_ponedelnik_2para
SELECT t.nomer_labaratoriy, t.disciplina, t.den_nedeli, t.nomer_pari, t.nomer_gryppi
FROM raspisanie1 t
WHERE t.nomer_gryppi LIKE '1%';
--- 5. В созданной таблице сдвинуть все пары на одну вверх по вторникам, четвергам и субботам.
UPDATE lab_ponedelnik_2para
SET nomer_pari = nomer_pari  - 1
WHERE den_nedeli IN ('Вторник', 'Четверг', 'Суббота');
--- 6. Удалить из созданной таблицы все занятия в 106 лаборатории по понедельникам.
DELETE FROM lab_ponedelnik_2para
WHERE nomer_labaratoriy = '106'
 AND den_nedeli = 'Понедельник';
--- 7. Посчитать количество занятий по дням недели для каждой лаборатории.
SELECT nomer_labaratoriy, den_nedeli, count(*)
FROM raspisanie1
GROUP BY nomer_labaratoriy, den_nedeli;