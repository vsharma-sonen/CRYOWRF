#ifdef __cplusplus
extern "C" {
    class SnowpackInterface;
    typedef SnowpackInterface FOO;
#else
    typedef struct FOO FOO;
#endif

FOO* create_foo(int in_size);
FOO* allot_add_foo(FOO* in_pointer, int loc);
int init_data_foo(FOO* foo, int,double Lat, double Lon, double Altitude, double sn_tsk, double in_calc_step_length, int f_counter, int in_grid,
                  int I, int J, int, int, int, int, int,int,double*,double*,double*,double*,double*,double*,
                  double*,double*,double*,double*,double*,double*,bool,double,double&,double&,double&,double&);

int run_foo(FOO* foo, int, double, double, double, double, double, double&, double&, double&, double&,double&, double&, double, double, double, 
            double&,double&,double&,double&,double&,double&,double&,double&, double&, double, double, double, double&, int, int, int, int, double,
            double&,double&,double&,double&,double&,double&,double&,double&,double&,double&,double&,double&,double&,double&,double&,double&,double*,
	    double*,double*,double*,double*,double*,double*,double*,double*,double*,double*,double*,bool,int&,double, 
            double&, double&, double&, double&, double&, double&, double&,double&);
#ifdef __cplusplus
}
#endif
