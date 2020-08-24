module libfoo
    use iso_c_binding

    private
    public :: foo

    include "foo_cdef.f90"

    type foo
       private
       type(c_ptr) :: ptr
    contains
       procedure :: run => run_foo
       procedure :: init_data => init_data_foo
       procedure :: allot_add => allot_add_foo
    end type

    interface foo
       procedure create_foo
    end interface

!    interface allot
!       procedure allot_add_foo
!    end interface

contains

    function create_foo(in_size)
        implicit none
        type(foo) :: create_foo
        integer, intent(in) :: in_size
        create_foo%ptr = create_foo_c(in_size)
    end function

    function allot_add_foo(this,in_pointer,loc)
        implicit none
        type(foo) :: allot_add_foo
        class(foo), intent(in) :: this
        class(foo), intent(in) :: in_pointer
        integer, intent(in) :: loc 
        allot_add_foo%ptr = allot_add_foo_c(in_pointer%ptr,loc)
    end function 
 
    integer function run_foo(this,snpack_layers_to_save,a1,a2,a3,a4,a5,a6,d1,d2,d3,d4,d5,a7,a8,a9,b1,b2,b3,b4,b5,b6,b7, &
&                             e1,e2,e3,e4,e5,f1,k1,k2,k3,k4,p1, &
&                             n1,n2,n3,n4,n5,m1,m2,n6,n7,n8,n9,n10,n11,n12,n13,n14,arr_1,arr_2,arr_3,arr_4,arr_5,arr_6, &
&                             arr_7,arr_8, &
&                             arr_9,arr_10,arr_11,arr_12,bs_bool,gg1,wrf_rho,bs_bdg_total,qi_in,qni_in,bs_K,bs_mass_turb, &
&                             bs_number_turb,in_hsalt,psi_s)
        implicit none
        class(foo), intent(in) :: this
        integer, intent(in) :: snpack_layers_to_save
        double precision, intent(in) :: wrf_rho
        double precision, intent(in) :: a1,a2,a3,a4,a5,a7,a8,a9
        double precision, intent(inout) :: a6
        double precision, intent(inout) :: d1,d2,d3
        double precision, intent(inout) :: d4,d5
        double precision, intent(inout) :: b1,b2,b3,b4,b5,b6,b7
        double precision, intent(inout) :: e1,e2,f1
        double precision, intent(in) :: e3,e4,e5!,f1
        integer, intent(in) :: k1,k2,k3,k4
        double precision, intent(in) :: p1
        double precision, intent(inout) :: m1,m2
        double precision, intent(inout) :: n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,n13,n14
        double precision, intent(inout), dimension(snpack_layers_to_save) :: arr_1
        double precision, intent(inout), dimension(snpack_layers_to_save) :: arr_2,arr_3,arr_4,arr_5,arr_6,arr_12
        double precision, intent(inout), dimension(snpack_layers_to_save) :: arr_7,arr_8,arr_9,arr_10,arr_11
        logical,intent(in) :: bs_bool
        integer,intent(inout) :: gg1
        double precision, intent(inout) :: bs_bdg_total,qi_in,qni_in,bs_K,bs_mass_turb,bs_number_turb
        double precision, intent(inout) :: in_hsalt,psi_s
        run_foo = run_foo_c(this%ptr,snpack_layers_to_save,a1,a2,a3,a4,a5,a6,d1,d2,d3,d4,d5,a7,a8,a9,b1,b2,b3,b4,b5,b6,b7,&
                            & e1,e2,e3,e4,e5,f1,k1,k2,k3,k4,p1,&
                            & n1,n2,n3,n4,n5,m1,m2,n6,n7,n8,n9,n10,n11,n12,n13,n14,arr_1,&
                            & arr_2,arr_3,arr_4,arr_5,arr_6,arr_7,arr_8,arr_9,arr_10,arr_11,arr_12,logical(bs_bool,1),&
                            & gg1,wrf_rho,bs_bdg_total,qi_in,qni_in,bs_K,bs_mass_turb,bs_number_turb,in_hsalt,psi_s)
    end function

    integer function init_data_foo(this,snpack_lay_to_save,a,b,c,d,e,f,g,i,j,yr,month,day,hour,minute,snpack_nlayers, &
&                            arr_T,arr_thick,arr_volI,arr_volW, &
&                            arr_volV,arr_rg,arr_rb,arr_dd,arr_sp,arr_cdot,arr_meta,arr_depd,start_from_file,wrf_rho,&
&                            snowh,snow,snpack_dt,snpack_write_dt)
        implicit none
        class(foo), intent(in) :: this
        integer,intent(in) :: snpack_lay_to_save
        double precision, intent(in) :: a,b,c,d,e,wrf_rho
        integer, intent(in) :: f,g,i,j
        integer, intent(in) :: yr,month,day,hour,minute,snpack_nlayers
        double precision, intent(inout), dimension(1:snpack_lay_to_save) :: arr_T,arr_depd
        double precision, intent(inout), dimension(1:snpack_lay_to_save) :: arr_thick,arr_volI,arr_volW,arr_volV,arr_rg
        double precision, intent(inout), dimension(1:snpack_lay_to_save) :: arr_rb,arr_dd,arr_sp,arr_cdot,arr_meta
        logical,intent(in) :: start_from_file
        double precision, intent(inout) :: snowh,snow
        double precision,intent(inout) :: snpack_dt,snpack_write_dt

        init_data_foo = init_data_foo_c(this%ptr,snpack_lay_to_save,a,b,c,d,e,f,g,i,j,yr,month,day,hour,minute,snpack_nlayers,&
                                        & arr_T,arr_thick,arr_volI,arr_volW, &
                                        & arr_volV,arr_rg,arr_rb,arr_dd,arr_sp, &
                                        & arr_cdot,arr_meta,arr_depd,logical(start_from_file,1),wrf_rho,snowh,snow, &
                                        & snpack_dt,snpack_write_dt)
    end function 

end module
