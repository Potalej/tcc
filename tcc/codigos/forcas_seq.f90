DO a = 2, N
    DO b = 1, a - 1
        ...
        Fab = G * m(a) * m(b) * (Rab) * distancia_inv
        forcas_seq(a,:) = forcas_seq(a,:) + Fab
        forcas_seq(b,:) = forcas_seq(b,:) - Fab
    END DO
END DO