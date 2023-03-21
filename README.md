# FPGAA_Code
 
## Codes

| No  | File                                                                                                                                  | Functionality                                                                          |
| --- | ------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| -   | [SEG7_LUT_6.v](https://github.com/belongtothenight/FPGAA_Code/blob/main/src/SEG7_LUT_6.v)                                             | 6 7-segment display module.                                                            |
| 1.  | [signed4bits_2funCal_disAddSub.v](https://github.com/belongtothenight/FPGAA_Code/blob/main/src/signed4bits_2funCal_disAddSub.v)       | 4 bits calculator can display, add, subtract numbers.                                  |
| 2.  | [signed4bits_3funCal_disAddSubMul.v](https://github.com/belongtothenight/FPGAA_Code/blob/main/src/signed4bits_3funCal_disAddSubMul.v) | 4 bits calculator can display, add, subtract, multiply numbers.                        |
| 3.  | [signed4bits_3funCal_disAddSubDiv.v](https://github.com/belongtothenight/FPGAA_Code/blob/main/src/signed4bits_3funCal_disAddSubDiv.v) | 4 bits calculator can display, add, subtract, divide numbers.                          |
| 4.  | [signed4bits_4funCal_addSubMulDiv.v](https://github.com/belongtothenight/FPGAA_Code/blob/main/src/signed4bits_4funCal_addSubMulDiv.v) | 4 bits calculator can add, subtract, multiply, divide numbers.                         |
| 5.  | [button_counter_main.v](https://github.com/belongtothenight/FPGAA_Code/blob/main/src/button_counter_main.v)                           | Display two sets of numbers as counters individually controlled by buttons and switch. |
| -   | [COUNTER_BUTTON.v](https://github.com/belongtothenight/FPGAA_Code/blob/main/src/COUNTER_BUTTON.v)                                     | Control buttons and switchs to display counter values. With repeating adding bug.      |
| -   | [COUNTER_DEBOUNCE.v](https://github.com/belongtothenight/FPGAA_Code/blob/main/src/COUNTER_DEBOUNCE.v)                                 | Control buttons and switchs to display counter values. No bug.                         |
| 6.  | [counter_10.v](https://github.com/belongtothenight/FPGAA_Code/blob/main/src/counter_10.v)                                             | A counter powered with internal clock.                                                 |
| -   | [counter_tb.v](https://github.com/belongtothenight/FPGAA_Code/blob/main/src/counter_tb.v)                                             | Testing file of counter_10.v                                                           |


## Note

1. The divider function in No.3 & No.4 can't properly calculate the quotient of $Z^+\div Z^-$. Not sure about $Z^-\div Z^-$.

