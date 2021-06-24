ALTER TABLE LogNavegacao
ADD OrigemNormalized nvarchar(50);

-- normalizacao do campo origem
UPDATE LogNavegacao 
SET 
    OrigemNormalized = 'DESKTOP' WHERE Origem = 'NULL';


-- normalizacao do campo origem
UPDATE LogNavegacao 
SET 
    OrigemNormalized = 'PORTAL' WHERE Origem = '100000016';