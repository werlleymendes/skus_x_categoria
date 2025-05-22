SELECT a.nroempresa NRO_LOJA, e.categoria, f.nomereduzido LOJA, COUNT(a.seqproduto) QUANT_SKUS
  FROM consinco.mrl_produtoempresa a
  JOIN consinco.map_produto b
  ON a.seqproduto = b.seqproduto
  JOIN consinco.map_familia c
       ON b.seqfamilia = c.seqfamilia
  JOIN consinco.map_famdivcateg d
       ON c.seqfamilia = d.seqfamilia
  JOIN consinco.map_categoria e
       ON e.seqcategoria = d.seqcategoria
  JOIN consinco.ge_empresa f
       ON a.nroempresa = f.nroempresa         
  where a.statuscompra = 'A' and
        e.statuscategor = 'A' and 
        d.status = 'A' AND
        e.nivelhierarquia = 1
  GROUP BY a.nroempresa, f.nomereduzido, e.categoria
  ORDER BY e.categoria, a.nroempresa;
  

  
  
