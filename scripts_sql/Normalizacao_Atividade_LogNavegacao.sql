ALTER TABLE LogNavegacao
ADD AtividadeNormalized nvarchar(50);



-- normalizacao do campo atividade
UPDATE LogNavegacao 
SET 
    AtividadeNormalized = REPLACE(atividade, 'da', '');

UPDATE LogNavegacao 
SET 
    AtividadeNormalized = REPLACE(atividadenormalized, 'em', '');


UPDATE LogNavegacao 
SET 
    AtividadeNormalized = REPLACE(atividadenormalized, 'em', '');

UPDATE LogNavegacao 
SET 
    AtividadeNormalized = REPLACE(atividadenormalized, 'Visualiza', '');

UPDATE LogNavegacao 
SET 
    AtividadeNormalized = REPLACE(atividadenormalized, 'Atualiza', '');

UPDATE LogNavegacao 
SET 
    AtividadeNormalized = REPLACE(atividadenormalized, 'Cria', '');