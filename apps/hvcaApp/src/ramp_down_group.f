      subroutine ramp_down_group(igrno)
      implicit none
      include 'hv.inc'
      character*100 pvname
      integer*4 ich, iret_code, lenpv, igrno
      integer*2 izero/0/
      do ich = 1, nchan_hv
        if (group_hv(ich) .eq. igrno) then
          call get_pvname(ich, pvname, lenpv)
          call p_value(pvname(1:lenpv)//'.CEO', 'short', izero, 1,
     &      iret_code)
          if (iret_code .ne. 0) print *, ' return code from put',
     &      iret_code
        end if
      end do
      return
      end
