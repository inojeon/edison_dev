      program sample

      CHARACTER(len=16) :: cmd_option_name , value_name
      CHARACTER(len=512) :: inputdeck
      INTEGER :: num_of_args, i, io_status
      LOGICAL :: args_error_flag = .false.

      INTEGER INT1
      DOUBLE PRECISION REAL1
      CHARACTER LIST1, tempchar
      INTEGER :: VECTOR1(3)

      num_of_args = iargc()

      do i=1, num_of_args, 2
            call getarg(i,cmd_option_name)

            if( cmd_option_name .eq. "-inp") then
                  call getarg(i+1,inputdeck)
                  WRITE (*,*)  trim(inputdeck)
            else
                  args_error_flag = .true.
                  WRITE (*,*) "ERROR: INVALID COMAND OPTION: " ,
     +            cmd_option_name
            endif
      enddo

      if ( args_error_flag .eqv. .true. ) then
            WRITE(*,*) "CHECK YOUR COMAND OPTION"
            stop
      endif
        
      open(1,file=trim(inputdeck),iostat=io_status, status='old')
      if (io_status /= 0) then
            write(*,*) 'File open error'
            stop
      end if

      do 
            READ(1,*, IOSTAT=io) value_name
            if ( io < 0) then
                  WRITE(*,*) "Inputdeck file read end"
                  EXIT
            end if 

            BACKSPACE (1)
            
            if ( value_name .eq. "INT1") then
                  READ(1,*) value_name,  INT1
                  WRITE(*,*) "INT1 = ", INT1
            else if ( value_name .eq. "REAL1") then
                  READ(1,*) value_name,  REAL1
                  WRITE(*,*) "REAL1 = ", REAL1
            else  if ( value_name .eq. "LIST1") then
                  read(1,*) value_name,  LIST1
                  write(*,*) "list = ", LIST1
            else  if ( value_name .eq. "VECTOR1") then
                  read(1,*) value_name, tempchar, VECTOR1(1),
     + VECTOR1(2), VECTOR1(3)
                  write(*,*) "Vector = ", VECTOR1(1), VECTOR1(2), 
     + VECTOR1(3) 
            else 
                  WRITE(*,*) "Inputdeck value read error" 
                  stop       
            endif
      end do



      CLOSE(1)


      end program
