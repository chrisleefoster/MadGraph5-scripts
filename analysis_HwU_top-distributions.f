c
c Example analysis for "p p > t t~ a [QCD]" process. Melnikov (1102.1967) variables and binning. Modified by Alberto, further modified by Chris
c
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine analysis_begin(nwgt,weights_info)
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      implicit none
      integer nwgt
      character*(*) weights_info(*)
      integer i,l
      character*5 cc(2)
      data cc/'     ','cuts '/
      double precision pi
      PARAMETER (PI=3.14159265358979312D0)
      call HwU_inithist(nwgt,weights_info)
      do i=1,2
        l=(i-1)*2
        call HwU_book(l+ 1,'t pt          '//cc(i),100, 0.d0,500.d0)
        call HwU_book(l+ 2,'y_t           '//cc(i), 50,-5.d0,  5.d0)
      enddo
      return
      end

cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine analysis_end(dummy)
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      implicit none
      double precision dummy
      call HwU_write_file
      return                
      end


cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine analysis_fill(p,istatus,ipdg,wgts,ibody)
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      implicit none
      include 'nexternal.inc'
      integer istatus(nexternal)
      integer iPDG(nexternal)
      double precision p(0:4,nexternal)
      double precision wgts(*)
      integer ibody
      integer i,l,jj
      integer ntop,ntopb,na
      double precision xptq(0:3),xptb(0:3),yptqtb(0:3),xpa(0:3),ycut,ptcut,ptq1,ptq2,yq1,yq2
      logical siq1flag,siq2flag,ddflag
      double precision getrapidity
      external getrapidity
      double precision pi
      PARAMETER (PI=3.14159265358979312D0)
      if (nexternal.ne.5) then
         write (*,*) 'error #1 in analysis_fill: '/
     &        /'only for process "p p > t t~ [QCD]"'
      endif
      if (.not. (abs(ipdg(1)).le.5 .or. ipdg(1).eq.21)) then
         write (*,*) 'error #2 in analysis_fill: '/
     &        /'only for process "p p > t t~ [QCD]"'
      endif
      if (.not. (abs(ipdg(2)).le.5 .or. ipdg(2).eq.21)) then
         write (*,*) 'error #3 in analysis_fill: '/
     &        /'only for process "p p > t t~ [QCD]"'
      endif
      if (.not. (abs(ipdg(5)).le.5 .or. ipdg(5).eq.21)) then
         write (*,*) 'error #4 in analysis_fill: '/
     &        /'only for process "p p > t t~ [QCD]"'
      endif
      if (ipdg(3).ne.6) then
         write (*,*) 'error #5 in analysis_fill: '/
     &        /'only for process "p p > t t~ [QCD]"'
      endif
      if (ipdg(4).ne.-6) then
         write (*,*) 'error #6 in analysis_fill: '/
     &        /'only for process "p p > t t~ [QCD]"'
      endif
c
C IDENTIFY THE FINAL TOP AND ANTITOP MOMENTUM
      ntop=0
      ntopb=0
      na=0
      do jj=1,nexternal
         if (ipdg(jj).eq.6.and.istatus(jj).eq.1) then
            ntop=ntop+1
            do i=0,3
       	      xptq(i)=p(i,jj)
            enddo
         endif
         if (ipdg(jj).eq.-6.and.istatus(jj).eq.1) then
            ntopb=ntopb+1
            do i=0,3
       	      xptb(i)=p(i,jj)
            enddo
         endif
         if (ipdg(jj).eq.22.and.istatus(jj).eq.1) then
            na=na+1
            do i=0,3
       	      xpa(i)=p(i,jj)
            enddo
         endif
      enddo
C DEFINE SUM OF TOP AND ANTITOP MOMENTUM
      do i=0,3
        yptqtb(i)=xptq(i)+xptb(i)
      enddo

C FILL THE HISTOS
      YCUT=2.5D0
      PTCUT=30.D0

      ptq1 = dsqrt(xptq(1)**2+xptq(2)**2)
      ptq2 = dsqrt(xptb(1)**2+xptb(2)**2)
      yq1=getrapidity(xptq(0),xptq(3))
      yq2=getrapidity(xptb(0),xptb(3))

c-------------------------------------------------------------
      siq1flag=ptq1.gt.ptcut.and.abs(yq1).lt.ycut
      siq2flag=ptq2.gt.ptcut.and.abs(yq2).lt.ycut
      ddflag=siq1flag.and.siq2flag
c-------------------------------------------------------------
      l=0
      if(ptq1.gt.20) call HwU_fill(l+1,ptq1,WGTS)
      if(ptq1.gt.20) call HwU_fill(l+2,yq1,WGTS)
c
c***************************************************** with cuts
c
      l=l+2

      if(ddflag)then
         if(ptq1.gt.20) call HwU_fill(l+1,ptq1,WGTS)
         if(ptq1.gt.20) call HwU_fill(l+2,yq1,WGTS)
      endif
 999  return      
      end



      function getrapidity(en,pl)
      implicit none
      real*8 getrapidity,en,pl,tiny,xplus,xminus,y
      parameter (tiny=1.d-8)
      xplus=en+pl
      xminus=en-pl
      if(xplus.gt.tiny.and.xminus.gt.tiny)then
         if( (xplus/xminus).gt.tiny.and.(xminus/xplus).gt.tiny)then
            y=0.5d0*log( xplus/xminus  )
         else
            y=sign(1.d0,pl)*1.d8
         endif
      else 
         y=sign(1.d0,pl)*1.d8
      endif
      getrapidity=y
      return
      end


