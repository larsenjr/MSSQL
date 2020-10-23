SELECT kundeID, kundenavn, epost FROM kunder_dk
WHERE kundenavn = 'ford'
UNION ALL
SELECT kundeID, kundenavn, epost FROM kunder_no
WHERE kundenavn = 'ford'
UNION ALL
SELECT kundeID, kundenavn, epost FROM kunder_se
;