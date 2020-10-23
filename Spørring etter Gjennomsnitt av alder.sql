-- Finne gjennomsnitt på alderen til studentene. Floor legger til mindre desimaler.

Select floor(AVG (alder)) AS Gjennomsnitt
from student;