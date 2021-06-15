[#ftl]
/**
  ******************************************************************************
  * @file  : ${BoardName}.h
  * @brief : header file for the BSP Common driver
  ******************************************************************************
[@common.optinclude name=mxTmpFolder+ "/license.tmp"/][#--include License text --]
  ******************************************************************************
*/
[#assign IpInstance = ""]
[#assign IpName = ""]
[#assign IrqNumber = ""]
[#assign ExtiLine = ""]

[#assign useLED = false]
[#assign LED2_PORT = ""]
[#assign LED2_PIN = ""]

[#assign useUSART = false]
[#assign UsartInstance = ""]
[#assign UART_PORT = ""]
[#assign UART_PIN = ""]
[#assign useDefine = false]


 
[#list BspIpDatas as SWIP] 
    [#if SWIP.variables??]
        [#list SWIP.variables as variables]
            [#if variables.name?contains("IpInstance")]
                [#assign IpInstance = variables.value]
            [/#if]
            [#if variables.name?contains("IpName")]
                [#assign IpName = variables.value]
            [/#if]	
            [#if variables.name?contains("GPIO_INT_NUM")]
                [#assign IrqNumber = variables.value]
				
            [/#if]
            [#if variables.name?contains("EXTI_LINE_NUMBER")]
                [#assign ExtiLine = variables.value]
				
            [/#if]			
            [#if variables.value?contains("BSP LED")]
                [#assign LED2_PORT = IpName]
                [#assign LED2_PIN = IpInstance]	
				[#assign useLED = true]								
            [/#if]            
        [/#list]
    [/#if]
[/#list] 
 
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __${BoardName?upper_case}_H
#define __${BoardName?upper_case}_H

#ifdef __cplusplus
 extern "C" {
#endif 

/* Includes ------------------------------------------------------------------*/ 
#include "${BoardName}_conf.h"
#include "${BoardName}_errno.h"
#include "main.h"



[#if useLED]
/** @defgroup ${BoardName?upper_case}_LOW_LEVEL_LED ${BoardName?upper_case} LOW LEVEL LED
 * @{
 */  
#define LEDn                              1U
#define LED2_PIN                     	  ${LED2_PIN}
#define LED2_GPIO_PORT                    ${LED2_PORT}
#define LED2_GPIO_CLK_ENABLE()            __HAL_RCC_${LED2_PORT}_CLK_ENABLE()
#define LED2_GPIO_CLK_DISABLE()           __HAL_RCC_${LED2_PORT}_CLK_DISABLE()  

[/#if]
/**
 * @}
 */ 

  

#ifdef __cplusplus
}
#endif

#endif /* __${BoardName?upper_case}__H */
    
/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
