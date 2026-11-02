UPDATE lab_ponedelnik_2para
SET nomer_pari = nomer_pari  - 1
WHERE den_nedeli IN ('Вторник', 'Четверг', 'Суббота');