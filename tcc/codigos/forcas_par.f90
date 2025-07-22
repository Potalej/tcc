forcas_par(:,:) = 0

!$OMP PARALLEL SHARED(forcas_par) PRIVATE(forcas_local, ...)
    forcas_local(:,:) = 0
    !$OMP DO
    DO a = 2, N
        DO b = 1, a-1
            ...
            Fab = G * m(a) * m(b) * Rab * distancia_inv
            forcas_local(a,:) = forcas_local(a,:) + Fab
            forcas_local(b,:) = forcas_local(b,:) - Fab
        END DO
    END DO
    !$OMP END DO
    
    !$OMP CRITICAL
        forcas_par = forcas_par + forcas_local
    !$OMP END CRITICAL
!$OMP END PARALLEL