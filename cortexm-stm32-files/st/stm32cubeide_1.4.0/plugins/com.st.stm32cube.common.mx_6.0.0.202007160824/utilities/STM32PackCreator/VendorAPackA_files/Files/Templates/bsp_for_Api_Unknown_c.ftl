[#ftl]
/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : ${name}
  * @version        : ${version}
[#--  * @packageVersion : ${fwVersion} --]
  * @brief          : This file implements the board support package for the ...
  ******************************************************************************
[@common.optinclude name=mxTmpFolder+"/license.tmp"/][#--include License text --]
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
[#if SWIncludes??]
	[#list SWIncludes as include]
#include "${include}"
	[/#list]
[/#if]

/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/


/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */

/* USER CODE END PV */



/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/* Exported function prototypes ----------------------------------------------*/


/* USER CODE BEGIN PFP */
/* Private function prototypes -----------------------------------------------*/

/* USER CODE END PFP */

/* Private functions ---------------------------------------------------------*/

/* USER CODE BEGIN 1 */


/* USER CODE END 1 */


      
/* USER CODE BEGIN LowLevelInterface */
  
/* USER CODE END LowLevelInterface */
[#assign IpInstance = ""]
[#assign ExtiLine = ""]
[#assign IrqNumber = ""]
[#assign IpName = ""]

[#assign FUNCTION_PORT = ""]
[#assign FUNCTION_PIN = ""]
[#assign FUNCTION_IRQn = ""]
[#assign FUNCTION_EXTI = ""]

[#if BspIpDatas??]
[#list BspIpDatas as SWIP] 
	[#if SWIP.variables??]
[#assign BspUsed = true]	
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
			[#if variables.value?contains("FUNCTION NAME")]										
				[#assign FUNCTION_EXTI = ExtiLine]
				[#assign FUNCTION_PORT = IpName]
				[#assign FUNCTION_PIN  = IpInstance]
				[#assign FUNCTION_IRQn = IrqNumber]									
			[/#if]	
		[/#list]
	[/#if]
[/#list]
[/#if]

/**
  * @brief  
  * @param  param1
  * @retval USBD status
  */
ReturnCode (void *pdev)
{

#tif (HAL_GPIO_ReadPin(${BCD_PORT}, ${BCD_PIN}) == GPIO_PIN_SET)
  {
    /*wait for bus stabilization*/
    HAL_Delay(450);    
  } 
  return OK;
}


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
