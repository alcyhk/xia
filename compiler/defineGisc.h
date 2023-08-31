#define OP_TAG 0x4
#define OP_ASN 0x1
#define OP_CPY 0x2
#define OP_GO 0x3
#define OP_DMY 0x0 

#define OP_DRM       0xb
#define OP_B2D       0xa

#define OP_SYN       0x9
#define OP_M2B       0x8
#define OP_B2M       0x7

#define OP_PTG       0x6
#define OP_PTS      0x5


#define OP_TAG       0x4
#define OP_SET      0x1 
#define OP_CPY     0x2 
#define OP_JMP     0x3 

#define SGV_CODE 0xfff300
#define SGV 0xfff200
#define PMV 0xfff100

#define SGV_REGVAL0 (SG_REGVAL0+SGV)
#define SGV_REGVAL1 (SG_REGVAL1+SGV)
#define SGV_REGVAL2 (SG_REGVAL2+SGV)
#define SGV_REGVAL3 (SG_REGVAL3+SGV)

#define SGV_PARA0_A0 (SG_PARA0_A0+SGV)
#define SGV_PARA0_B0 (SG_PARA0_B0+SGV)
#define SGV_PARA0_S (SG_PARA0_S+SGV)
#define PMV_PARA0_C (PM_PARA0_C+PMV)

#define SGV_CODE_ADDR (SGV_CODE+2)
#define SGV_CODE_ADDR_COND (SGV_CODE+1)

#define SGV_REGVAL4 (SG_REGVAL4+SGV)
#define SGV_REGVAL5 (SG_REGVAL5+SGV)
#define SGV_REGVAL6 (SG_REGVAL6+SGV)
#define SGV_REGVAL7 (SG_REGVAL7+SGV)

#define PMV_DDR_READ_0 (PM_DDR_READ_0+PMV)
#define PMV_DDR_READ_1 (PM_DDR_READ_1+PMV)
#define PMV_DDR_READ_2 (PM_DDR_READ_2+PMV)
#define PMV_DDR_READ_3 (PM_DDR_READ_3+PMV)
#define PMV_DDR_READ_4 (PM_DDR_READ_4+PMV)
#define PMV_DDR_READ_5 (PM_DDR_READ_5+PMV)
#define PMV_NOR_DATA (PM_NOR_DATA+PMV)
#define PMV_MMC_DATA_READ (PM_MMC_DATA_READ+PMV)
#define PMV_TWI_DATA_READ (PM_TWI_DATA_READ+PMV)
#define PMV_GPIO_GROUP_GET (PM_GPIO_GROUP_GET+PMV)

#define PMV_ADC_DATA (PM_ADC_DATA+PMV)
#define PMV_SPI_DATA_GET (PM_SPI_DATA_GET+PMV)

#define PMV_TWI_M_DATA_GET (PM_TWI_M_DATA_GET+PMV)

#define SGV_DDR_WRITE_0 (SG_DDR_WRITE_0+SGV)
#define SGV_DDR_WRITE_1 (SG_DDR_WRITE_1+SGV)
#define SGV_DDR_WRITE_2 (SG_DDR_WRITE_2+SGV)
#define SGV_DDR_WRITE_3 (SG_DDR_WRITE_3+SGV)
#define SGV_DDR_WRITE_4 (SG_DDR_WRITE_4+SGV)
#define SGV_DDR_WRITE_5 (SG_DDR_WRITE_5+SGV)
#define SGV_DDR_ADDR (SG_DDR_ADDR+SGV)


#define SGV_NOR_ADDR (SG_NOR_ADDR+SGV)
#define SGV_MMC_DATA_WRITE (SG_MMC_DATA_WRITE+SGV)
#define SGV_MMC_ADDR (SG_MMC_ADDR+SGV)
#define SGV_GPIO_GROUP_SET (SG_GPIO_GROUP_SET+SGV)
#define SGV_FMC_DATA_WRITE (SG_FMC_DATA_WRITE+SGV)
#define SGV_FMC_START_POINT (SG_FMC_START_POINT+SGV)
#define SGV_FMC_END_POINT (SG_FMC_END_POINT+SGV)
#define SGV_FMC_BRAM_ADDR (SG_FMC_BRAM_ADDR+SGV)

#define SGV_TWI_REGISTER (SG_TWI_REGISTER+SGV)
#define SGV_TWI_DATA_WRITE (SG_TWI_DATA_WRITE+SGV)

#define SGV_ADC_ADDR (SG_ADC_ADDR+SGV)
#define SGV_DAC_ADDR (SG_DAC_ADDR+SGV)
#define SGV_DAC_DATA (SG_DAC_DATA+SGV)

#define SGV_SPI_DATA_SET (SG_SPI_DATA_SET+SGV)

#define SGV_TWI_M_DATA_SET (SG_TWI_M_DATA_SET+SGV)
#define SGV_TWI_M_DEV_REG (SG_TWI_M_DEV_REG+SGV)
#define SGV_TWI_M_DEV_ADDR (SG_TWI_M_DEV_ADDR+SGV)
#define SGV_2BIT_GROUP_SET_TWI_M_CS (SG_2BIT_GROUP_SET_TWI_M_CS+SGV)




#define PMV_1BIT_GROUP_SET (PM_1BIT_GROUP_SET+PMV)


#define PMV_1BIT_G0_UART_RX0_EMPTY (PM_1BIT_G0_UART_RX0_EMPTY)
#define PMV_1BIT_G0_UART_RX1_EMPTY (PM_1BIT_G0_UART_RX1_EMPTY)
#define PMV_1BIT_G0_UART_RX2_EMPTY (PM_1BIT_G0_UART_RX2_EMPTY)
#define PMV_1BIT_G0_UART_RX3_EMPTY (PM_1BIT_G0_UART_RX3_EMPTY)


#define PMV_1BIT_G0_FIFO_QSPI (PM_1BIT_G0_FIFO_QSPI)


#define PMV_1BIT_G0_MMC_FIFOW_FULL (PM_1BIT_G0_MMC_FIFOW_FULL)
#define PMV_1BIT_G0_MMC_FIFOW_EMPTY (PM_1BIT_G0_MMC_FIFOW_EMPTY)
#define PMV_1BIT_G0_MMC_FIFOR_FULL (PM_1BIT_G0_MMC_FIFOR_FULL)
#define PMV_1BIT_G0_MMC_FIFOR_EMPTY (PM_1BIT_G0_MMC_FIFOR_EMPTY)
#define PMV_1BIT_G0_MMC_ACT_IDLE (PM_1BIT_G0_MMC_ACT_IDLE)


#define PMV_1BIT_G0_FMC_FIFO_EMPTY (PM_1BIT_G0_FMC_FIFO_EMPTY)
#define PMV_1BIT_G0_FMC_FIFO_FULL (PM_1BIT_G0_FMC_FIFO_FULL)
#define PMV_1BIT_G0_FMC_ACT_IDLE (PM_1BIT_G0_FMC_ACT_IDLE)
#define PMV_1BIT_G0_SPI_IDLE (PM_1BIT_G0_SPI_IDLE)
#define PMV_1BIT_G0_TWI_M_IDLE (PM_1BIT_G0_TWI_M_IDLE)

#define SGV_1BIT_GROUP_SET (SG_1BIT_GROUP_SET+SGV)

#define SGV_1BIT_G0_UART_TX0 (SG_1BIT_G0_UART_TX0)
#define SGV_1BIT_G0_UART_TX1 (SG_1BIT_G0_UART_TX1)
#define SGV_1BIT_G0_UART_TX2 (SG_1BIT_G0_UART_TX2)
#define SGV_1BIT_G0_UART_TX3 (SG_1BIT_G0_UART_TX3)

#define SGV_1BIT_G0_UART_RX0_REC_SET (SG_1BIT_G0_UART_RX0_REC_SET)
#define SGV_1BIT_G0_UART_RX1_REC_SET (SG_1BIT_G0_UART_RX1_REC_SET)
#define SGV_1BIT_G0_UART_RX2_REC_SET (SG_1BIT_G0_UART_RX2_REC_SET)
#define SGV_1BIT_G0_UART_RX3_REC_SET (SG_1BIT_G0_UART_RX3_REC_SET)



#define SGV_1BIT_G0_NOR_FIFO_RO (SG_1BIT_G0_NOR_FIFO_RO)
#define SGV_1BIT_G0_NOR_QSPI_RO (SG_1BIT_G0_NOR_QSPI_RO)


#define SGV_1BIT_G0_MMC_FIFO_RO (SG_1BIT_G0_MMC_FIFO_RO)
#define SGV_1BIT_G0_MMC_FIFO_WO (SG_1BIT_G0_MMC_FIFO_WO)

#define SGV_1BIT_G0_FMC_DO (SG_1BIT_G0_FMC_DO)
#define SGV_1BIT_G0_FMC_WO (SG_1BIT_G0_FMC_WO)
#define SGV_1BIT_G0_FMC_RO (SG_1BIT_G0_FMC_RO)


#define SGV_1BIT_G0_TWI_RO (SG_1BIT_G0_TWI_RO)
#define SGV_1BIT_G0_TWI_RW (SG_1BIT_G0_TWI_RW)

#define SGV_1BIT_DAC_ON_OFF (SG_1BIT_DAC_ON_OFF)

#define SGV_1BIT_SPI_SET_GET (SG_1BIT_SPI_SET_GET)
#define SGV_1BIT_SPI_RUN_ONCE (SG_1BIT_SPI_RUN_ONCE)

#define SGV_1BIT_TWI_M_SET_GET (SG_1BIT_TWI_M_SET_GET)
#define SGV_1BIT_TWI_M_RUN_ONCE (SG_1BIT_TWI_M_RUN_ONCE)





#define SGV_8BIT_GROUP_SET_TX0 (SG_8BIT_GROUP_SET_TX0+SGV)
#define PMV_8BIT_GROUP_GET_RX0 (PM_8BIT_GROUP_GET_RX0+PMV)

#define SGV_8BIT_GROUP_SET_TX1 (SG_8BIT_GROUP_SET_TX1+SGV)
#define PMV_8BIT_GROUP_GET_RX1 (PM_8BIT_GROUP_GET_RX1+PMV)

#define SGV_8BIT_GROUP_SET_TX2 (SG_8BIT_GROUP_SET_TX2+SGV)
#define PMV_8BIT_GROUP_GET_RX2 (PM_8BIT_GROUP_GET_RX2+PMV)

#define SGV_8BIT_GROUP_SET_TX3 (SG_8BIT_GROUP_SET_TX3+SGV)
#define PMV_8BIT_GROUP_GET_RX3 (PM_8BIT_GROUP_GET_RX3+PMV)

#define SGV_8BIT_GROUP_SET_DDR_OP (SG_8BIT_GROUP_SET_DDR_OP+SGV)
#define SGV_2BIT_GROUP_SET_MMC_OP (SG_2BIT_GROUP_SET_MMC_OP+SGV)
#define SGV_2BIT_GROUP_SET_SPI_OP (SG_2BIT_GROUP_SET_SPI_OP+SGV)



#define SGV_DDR_OP_REFRESH (SG_DDR_OP_REFRESH)
#define SGV_DDR_OP_WRITE (SG_DDR_OP_WRITE)
#define SGV_DDR_OP_READ (SG_DDR_OP_READ)
#define SGV_DDR_OP_IDLE (SG_DDR_OP_IDLE)


#define SGV_MMC_OP_READ (SG_MMC_OP_READ)
#define SGV_MMC_OP_WRITE (SG_MMC_OP_WRITE)
#define SGV_MMC_OP_IDLE (SG_MMC_OP_IDLE)


#define SGV_SET_TRUE (SG_SET_TRUE)
#define SGV_SET_FALSE (SG_SET_FALSE)

#define SG_REGVAL0 0x0
#define SG_REGVAL1 0x1
#define SG_REGVAL2 0x2
#define SG_REGVAL3 0x3

#define SG_ROM_ADDR_COND 0x4

#define SG_PARA0_A0 0x8
#define SG_PARA0_B0 0x9
#define SG_PARA0_S 0xa


#define PM_PARA0_C 0xe


#define PM_DDR_READ_0 0x7
#define PM_DDR_READ_1 0x8
#define PM_DDR_READ_2 0x9
#define PM_DDR_READ_3 0xa
#define PM_DDR_READ_4 0xb
#define PM_DDR_READ_5 0xc
   
#define PM_NOR_DATA 0xd

#define PM_MMC_DATA_READ 0x10

#define PM_TWI_DATA_READ 0x11
#define PM_GPIO_GROUP_GET 0x12

#define PM_ADC_DATA 0x13

#define PM_SPI_DATA_GET 0x14
#define PM_TWI_M_DATA_GET 0x15

#define SG_ROM_ADDR 0xf

#define SG_REGVAL4 0x10
#define SG_REGVAL5 0x11
#define SG_REGVAL6 0x12
#define SG_REGVAL7 0x13


#define SG_DDR_WRITE_0 0x14
#define SG_DDR_WRITE_1 0x15
#define SG_DDR_WRITE_2 0x16
#define SG_DDR_WRITE_3 0x1a
#define SG_DDR_WRITE_4 0x1b
#define SG_DDR_WRITE_5 0x1c
#define SG_DDR_ADDR 0x1d

#define SG_NOR_ADDR 0x1e

#define SG_MMC_DATA_WRITE 0x7
#define SG_MMC_ADDR 0x1f

#define SG_GPIO_GROUP_SET 0x20

#define SG_FMC_DATA_WRITE 0x21
#define SG_FMC_START_POINT 0x22
#define SG_FMC_END_POINT 0x25
#define SG_FMC_BRAM_ADDR 0x2d


#define SG_TWI_REGISTER 0x23
#define SG_TWI_DATA_WRITE 0x24


#define SG_ADC_ADDR 0x26

#define SG_DAC_ADDR 0x27
#define SG_DAC_DATA 0x28

#define SG_SPI_DATA_SET 0x29

#define SG_2BIT_GROUP_SET_SPI_OP 0x2a

#define SG_TWI_M_DATA_SET 0x2b
#define SG_2BIT_GROUP_SET_TWI_M_CS 0x2c

#define PM_1BIT_GROUP_SET 0x5

#define PM_1BIT_G0_UART_RX0_EMPTY BITS8(0b0000,0b0001)
#define PM_1BIT_G0_UART_RX1_EMPTY BITS8(0b0000,0b0010)
#define PM_1BIT_G0_UART_RX2_EMPTY BITS12(0b0001,0b0000,0b0000)
#define PM_1BIT_G0_UART_RX3_EMPTY BITS12(0b0010,0b0000,0b0000)


#define PM_1BIT_G0_FIFO_QSPI BITS8(0b0000,0b0100)

#define PM_1BIT_G0_MMC_FIFOW_FULL  BITS8(0b0000,0b1000)
#define PM_1BIT_G0_MMC_FIFOW_EMPTY BITS8(0b0001,0b0000)
#define PM_1BIT_G0_MMC_FIFOR_FULL  BITS8(0b0010,0b0000)
#define PM_1BIT_G0_MMC_FIFOR_EMPTY BITS8(0b0100,0b0000)
#define PM_1BIT_G0_MMC_ACT_IDLE    BITS8(0b1000,0b0000)


#define PM_1BIT_G0_FMC_FIFO_EMPTY BITS16(0b0000,0b0100,0b0000,0b0000)
#define PM_1BIT_G0_FMC_FIFO_FULL  BITS16(0b0000,0b1000,0b0000,0b0000)
#define PM_1BIT_G0_FMC_ACT_IDLE   BITS16(0b0001,0b0000,0b0000,0b0000)

#define PM_1BIT_G0_SPI_IDLE   BITS16(0b0010,0b0000,0b0000,0b0000)

#define PM_1BIT_G0_TWI_M_IDLE   BITS16(0b0100,0b0000,0b0000,0b0000)







#define SG_1BIT_GROUP_SET 0x5

#define SG_1BIT_G0_UART_TX0 BITS8(0b0000,0b0001)
#define SG_1BIT_G0_UART_TX1 BITS8(0b0000,0b0010)
#define SG_1BIT_G0_UART_TX2 BITS8(0b0000,0b0100)
#define SG_1BIT_G0_UART_TX3 BITS8(0b0000,0b1000)

#define SG_1BIT_G0_UART_RX0_REC_SET BITS8(0b0010,0b0000)
#define SG_1BIT_G0_UART_RX1_REC_SET BITS8(0b0100,0b0000)
#define SG_1BIT_G0_UART_RX2_REC_SET BITS12(0b0000,0b1000,0b0000)
#define SG_1BIT_G0_UART_RX3_REC_SET BITS12(0b0001,0b0000,0b0000)


#define SG_1BIT_G0_NOR_FIFO_RO BITS12(0b0010,0b0000,0b0000)
#define SG_1BIT_G0_NOR_QSPI_RO BITS12(0b0100,0b0000,0b0000)

#define SG_1BIT_G0_MMC_FIFO_RO BITS16(0b0000,0b1000,0b0000,0b0000)
#define SG_1BIT_G0_MMC_FIFO_WO BITS16(0b0001,0b0000,0b0000,0b0000)

#define SG_1BIT_G0_FMC_DO      BITS16(0b0010,0b0000,0b0000,0b0000)
#define SG_1BIT_G0_FMC_WO      BITS16(0b0100,0b0000,0b0000,0b0000)

#define SG_1BIT_G0_FMC_RO BITS24(0b0100,0b0000,0b0000,0b0000,0b0000,0b0000)



#define SG_1BIT_G0_TWI_RO BITS20(0b0000,0b1000,0b0000,0b0000,0b0000)
#define SG_1BIT_G0_TWI_RW BITS20(0b0001,0b0000,0b0000,0b0000,0b0000)

#define SG_1BIT_DAC_ON_OFF BITS20(0b0010,0b0000,0b0000,0b0000,0b0000)

#define SG_1BIT_SPI_SET_GET BITS20(0b0100,0b0000,0b0000,0b0000,0b0000)
#define SG_1BIT_SPI_RUN_ONCE BITS20(0b1000,0b0000,0b0000,0b0000,0b0000)

#define SG_1BIT_TWI_M_SET_GET BITS24(0b0001,0b0000,0b0000,0b0000,0b0000,0b0000)
#define SG_1BIT_TWI_M_RUN_ONCE BITS24(0b0010,0b0000,0b0000,0b0000,0b0000,0b0000)



#define SG_8BIT_GROUP_SET_TX0 0x6
#define PM_8BIT_GROUP_GET_RX0 0x6

#define SG_8BIT_GROUP_SET_TX1 0x6
#define PM_8BIT_GROUP_GET_RX1 0x6

#define SG_8BIT_GROUP_SET_TX2 0x6
#define PM_8BIT_GROUP_GET_RX2 0x6

#define SG_8BIT_GROUP_SET_TX3 0x6
#define PM_8BIT_GROUP_GET_RX3 0x6

#define SG_8BIT_GROUP_SET_DDR_OP 0xb

#define SG_2BIT_GROUP_SET_MMC_OP 0xc



#define SG_DDR_OP_REFRESH BITS8(0b0000,0b0011)
#define SG_DDR_OP_WRITE BITS8(0b0000,0b0010)
#define SG_DDR_OP_READ BITS8(0b0000,0b0001)
#define SG_DDR_OP_IDLE BITS8(0b0000,0b0000)


#define SG_MMC_OP_READ  BITS8(0b0000,0b0010)
#define SG_MMC_OP_WRITE BITS8(0b0000,0b0001)
#define SG_MMC_OP_IDLE  BITS8(0b0000,0b0000)


#define SG_SET_TRUE BITS8(0b0000,0b0001)
#define SG_SET_FALSE BITS8(0b0000,0b0000)

#define PARA_SELECT_MASK_AND 0x0
#define PARA_SELECT_MASK_OR 0x1

#define PARA_SELECT_ARITH_SUB 0x2
#define PARA_SELECT_LOGIC_EQUAL 0x3
#define PARA_SELECT_ARITH_ADD 0x4

#define PARA_SELECT_LOGIC_GREATER 0x5
#define PARA_SELECT_LOGIC_SMALLER 0x6

#define PARA_SELECT_ARITH_MUL 0x7
#define PARA_SELECT_ARITH_DIV 0x8

#define PARA_SELECT_LOGIC_AND 0x9
#define PARA_SELECT_LOGIC_OR 0xa
#define PARA_SELECT_ARITH_MOD 0xb



#define PARA_SELECT_FLOAT_I2F  0xc
#define PARA_SELECT_FLOAT_F2I  0xd


#define PARA_SELECT_FLOAT_ADD  0xe
#define PARA_SELECT_FLOAT_SUB  0xf
#define PARA_SELECT_FLOAT_MUL  0x10
#define PARA_SELECT_FLOAT_DIV  0x11



#define PARA_SELECT_FLOAT_SQRT  0x12
#define PARA_SELECT_FLOAT_LOG  0x13

#define PARA_SELECT_FLOAT_EXP  0x14


#define PARA_SELECT_FLOAT_CMP_UNORDERD  0x15
#define PARA_SELECT_FLOAT_CMP_LESS  0x16
#define PARA_SELECT_FLOAT_CMP_EQUAL  0x17         
#define PARA_SELECT_FLOAT_CMP_LESS_OR_EQUAL 0x18
#define PARA_SELECT_FLOAT_CMP_GREATER  0x19
#define PARA_SELECT_FLOAT_CMP_NOT  0x1a
#define PARA_SELECT_FLOAT_CMP_GREATER_OR_EQUAL 0x1b

#define PARA_SELECT_CORDIC_ATAN 0x1c
#define PARA_SELECT_CORDIC_ATANH 0x1d

#define PARA_SELECT_CORDIC_SIN 0x1e
#define PARA_SELECT_CORDIC_COS 0x1f

#define PARA_SELECT_CORDIC_SINH 0x20
#define PARA_SELECT_CORDIC_COSH 0x21

#define PARA_SELECT_SHIFT_LEFT 0x22
#define PARA_SELECT_SHIFT_RIGHT 0x23



#define BITS32(b1,b2,b3,b4,b5,b6,b7,b8) ( \
  ((b1) << 28) + \
  ((b2) << 24) + \
  ((b3) << 20) + \
  ((b4) << 16) + \
  ((b5) << 12) + \
  ((b6) << 8) + \
  ((b7) << 4) + \
  (b8))

#define BITS24(b1,b2,b3,b4,b5,b6) ( \
  ((b1) << 20) + \
  ((b2) << 16) + \
  ((b3) << 12) + \
  ((b4) << 8) + \
  ((b5) << 4) + \
  (b6))

#define BITS20(b1,b2,b3,b4,b5) ( \
  ((b1) << 16) + \
  ((b2) << 12) + \
  ((b3) << 8) + \
  ((b4) << 4) + \
  (b5))


#define BITS16(b1,b2,b3,b4) ( \
  ((b1) << 12) + \
  ((b2) << 8) + \
  ((b3) << 4) + \
  (b4))

#define BITS12(b1,b2,b3) ( \
  ((b1) << 8) + \
  ((b2) << 4) + \
  (b3))

#define BITS8(b1,b2) ( \
  ((b1) << 4) + \
  (b2))
