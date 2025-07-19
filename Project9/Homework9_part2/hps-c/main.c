#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "hwlib.h"
#include "socal/socal.h"
#include "socal/hps.h"
#include "socal/alt_gpio.h"
#include "hps_0.h"

#define HW_REGS_BASE ( ALT_STM_OFST )
#define HW_REGS_SPAN ( 0x04000000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )

int main() {

	void *virtual_base;
	int fd;
	int loop_count;
	int led_direction;
	int led_mask;
	int seven_segment_patterns[10];
	void *h2p_lw_led_addr;
	void *h2p_lw_ssd_addr[6];

	// map the address space for the LED registers into user space so we can interact with them.
	// we'll actually map in the entire CSR span of the HPS since we want to access various registers within that span

	if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}

	virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, HW_REGS_BASE );

	if( virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap() failed...\n" );
		close( fd );
		return( 1 );
	}

	h2p_lw_led_addr=virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + PIO_LED_BASE ) & ( unsigned long)( HW_REGS_MASK ) );

	h2p_lw_ssd_addr[0]=virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + PIO_SEVEN_SEGMENT_0_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	h2p_lw_ssd_addr[1]=virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + PIO_SEVEN_SEGMENT_1_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	h2p_lw_ssd_addr[2]=virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + PIO_SEVEN_SEGMENT_2_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	h2p_lw_ssd_addr[3]=virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + PIO_SEVEN_SEGMENT_3_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	h2p_lw_ssd_addr[4]=virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + PIO_SEVEN_SEGMENT_4_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	h2p_lw_ssd_addr[5]=virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + PIO_SEVEN_SEGMENT_5_BASE ) & ( unsigned long)( HW_REGS_MASK ) );


	// toggle the LEDs a bit

	loop_count = 0;
	led_mask = 0x01;
	led_direction = 0; // 0: left to right direction
	int hours = 0;
	int minutes = 0;
    	int seconds = 0;

	seven_segment_patterns[0] = 64;
   	seven_segment_patterns[1] = 121;
    	seven_segment_patterns[2] = 36;
    	seven_segment_patterns[3] = 48;
    	seven_segment_patterns[4] = 25;
    	seven_segment_patterns[5] = 18;
    	seven_segment_patterns[6] = 02;
    	seven_segment_patterns[7] = 120;
    	seven_segment_patterns[8] = 00;
    	seven_segment_patterns[9] = 16;

	while( 1 ) {

		// control led
		*(uint32_t *)h2p_lw_led_addr = ~led_mask;

		//control seven segments
		*(uint32_t *)h2p_lw_ssd_addr[5] = seven_segment_patterns[seconds/10];
		*(uint32_t *)h2p_lw_ssd_addr[4] = seven_segment_patterns[seconds%10];
		*(uint32_t *)h2p_lw_ssd_addr[3] = seven_segment_patterns[minutes/10];
		*(uint32_t *)h2p_lw_ssd_addr[2] = seven_segment_patterns[minutes%10];
		*(uint32_t *)h2p_lw_ssd_addr[1] = seven_segment_patterns[hours/10];
		*(uint32_t *)h2p_lw_ssd_addr[0] = seven_segment_patterns[hours%10];

		// wait 1000ms = 1s
		usleep( 1000*1000 );

		// update led mask
		if (led_direction == 0){
			led_mask <<= 1;
			if (led_mask == (0x01 << (PIO_LED_DATA_WIDTH-1)))
				 led_direction = 1;
		}else{
			led_mask >>= 1;
			if (led_mask == 0x01){
				led_direction = 0;
				loop_count++;
			}
		}


		seconds++;
        	if (seconds == 60) {
           	seconds = 0;

            	//Minutes
            	minutes++;
            	if (minutes == 60) {
                minutes = 0;

                //Hours
                hours++;
                if (hours == 24) {
                    hours = 0;
                }
            }
        }

	} // while


	// clean up our memory mapping and exit

	if( munmap( virtual_base, HW_REGS_SPAN ) != 0 ) {
		printf( "ERROR: munmap() failed...\n" );
		close( fd );
		return( 1 );
	}

	close( fd );

	return( 0 );
}
