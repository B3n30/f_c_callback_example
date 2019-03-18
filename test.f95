module test
 implicit none
 double precision value_1, value_2
 ABSTRACT INTERFACE
  SUBROUTINE callback (x)
    USE, INTRINSIC :: ISO_C_BINDING
    double precision, INTENT(IN) :: x
  END SUBROUTINE callback
END INTERFACE

 PROCEDURE(callback), POINTER :: random_number_from_c
end module

subroutine set_random_number_generator_(cproc) BIND(C)
 USE, INTRINSIC :: ISO_C_BINDING
 use test
 implicit none
    TYPE(C_FUNPTR), INTENT(IN), VALUE :: cproc
    ! Convert C to Fortran procedure pointer.
    CALL C_F_PROCPOINTER (cproc, random_number_from_c)
end

subroutine run()
 use test
 implicit none
 CALL random_number_from_c(value_1)
  if (value_1 .ne. value_2) then 
  print*, "value_1: ", value_1, " ne value_2: ", value_2
 end if
end

subroutine rnd(val_)
  use test
  implicit none
  double precision val_
 call random_number(value_2)
 val_ = value_2
end
