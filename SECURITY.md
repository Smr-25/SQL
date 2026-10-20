# Təhlükəsizlik siyasəti

Zəiflik tapsanız, lütfən public issue açmayın. Bu repo-nun "Security" bölməsindəki
"Report a vulnerability" düyməsi ilə məxfi şəkildə bildirin.

## Yoxlamanın əhatəsi

GitHub secret scanning, push protection və Gitleaks məxfi məlumat sızmasını yoxlayır.
Dependabot GitHub Actions asılılıqlarının yenilənməsini izləyir.
CodeQL T-SQL kodunu analiz etmir; Actions skanı SQL sorğularının təhlükəsizliyinə zəmanət deyil.

Bu repodakı skriptlər tədris üçündür. Onları yalnız ayrıca sınaq bazasında,
minimum səlahiyyətli istifadəçi ilə işlədin. `DROP TABLE` və `DROP PROCEDURE`
nümunələri məlumat və obyektləri silə bilər. İstehsal bazasında bütöv faylı işlətməyin.
Tətbiqə köçürülən sorğulara xarici giriş yalnız parametr vasitəsilə verilməlidir.
