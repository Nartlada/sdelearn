worry_score <- function(x) {
  case_when(
    x == 'กังวลมาก' ~ 4,
    x == 'ค่อนข้างกังวล' ~ 3,
    x == 'กังวลเล็กน้อย' ~ 2,
    x == 'ไม่กังวลเลย' ~ 1,
    TRUE ~ NA_real_
  )
}

intent_score <- function(x) {
  case_when(
    x == 'ฉันจะปฏิเสธ หรือพยายามหาคนอื่นทำแทน' ~ 4,
    x == 'ฉันจะทำ แต่ฉันจะหลีกเลี่ยงการสัมผัสผู้ป่วยให้มากที่สุด' ~ 3,
    x == 'ฉันจะทำ แต่ทำโดยป้องกันเป็นพิเศษมากกว่าการป้องกันตามปกติ' ~ 2,
    x == 'ฉันจะทำเหมือนกับที่ฉันทำให้ผู้ป่วยรายอื่น ๆ' ~ 1,
    TRUE ~ NA_real_
  )
}

intent_score2 <- function(x) {
  case_when(
    x == 'ฉันจะปฏิเสธ หรือพยายามหาคนอื่นทำแทน' ~ 1,
    x == 'ฉันจะทำ แต่ฉันจะหลีกเลี่ยงการสัมผัสผู้ป่วยให้มากที่สุด' ~ 1,
    x == 'ฉันจะทำ แต่ทำโดยป้องกันเป็นพิเศษมากกว่าการป้องกันตามปกติ' ~ 1,
    x == 'ฉันจะทำเหมือนกับที่ฉันทำให้ผู้ป่วยรายอื่น ๆ' ~ 0,
    TRUE ~ NA_real_
  )
}

norm_score <- function(x) {
  case_when(
    x == 'ไม่มี' ~ 4,
    x == 'บางคน' ~ 3,
    x == 'ส่วนใหญ่' ~ 2,
    x == 'ทั้งหมด' ~ 1,
    TRUE ~ NA_real_
  )
}

norm_score_rev <- function(x) {
  case_when(
    x == 'ไม่มี' ~ 1,
    x == 'บางคน' ~ 2,
    x == 'ส่วนใหญ่' ~ 3,
    x == 'ทั้งหมด' ~ 4,
    TRUE ~ NA_real_
  )
}

agree_score <- function(x) {
  case_when(
    x == 'ไม่เห็นด้วยอย่างยิ่ง' ~ 4,
    x == 'ไม่ค่อยเห็นด้วย' ~ 3,
    x == 'ค่อนข้างเห็นด้วย' ~ 2,
    x == 'เห็นด้วยอย่างยิ่ง' ~ 1,
    TRUE ~ NA_real_
  )
}

agree_score_rev <- function(x) {
  case_when(
    x == 'ไม่เห็นด้วยอย่างยิ่ง' ~ 1,
    x == 'ไม่ค่อยเห็นด้วย' ~ 2,
    x == 'ค่อนข้างเห็นด้วย' ~ 3,
    x == 'เห็นด้วยอย่างยิ่ง' ~ 4,
    TRUE ~ NA_real_
  )
}

agree_score2 <- function(x) {
  case_when(
    x == 'Disagree' ~ 2,
    x == 'Agree' ~ 1,
    TRUE ~ NA_real_
  )
}

agree_score2_rev <- function(x) {
  case_when(
    x == 'Disagree' ~ 1,
    x == 'Agree' ~ 2,
    TRUE ~ NA_real_
  )
}

comfort_score <- function(x) {
  case_when(
    x == 'ไม่สะดวกใจมาก' ~ 4,
    x == 'ค่อนข้างไม่สะดวกใจ' ~ 3,
    x == 'ค่อนข้างสะดวกใจ' ~ 2,
    x == 'สะดวกใจมาก' ~ 1,
    TRUE ~ NA_real_
  )
}

tf_score <- function(x) {
  case_when(
    x == 'ถูก' ~ 1,
    x == 'ผิด' ~ 0,
    TRUE ~ NA_real_
  )
}

tf_score_rev <- function(x) {
  case_when(
    x == 'ถูก' ~ 0,
    x == 'ผิด' ~ 1,
    TRUE ~ NA_real_
  )
}

important_score <- function(x) {
  case_when(
    x == 'สำคัญมาก' ~ 4,
    x == 'ค่อนข้างสำคัญ' ~ 3,
    x == 'ไม่ค่อยสำคัญ' ~ 2,
    x == 'ไม่สำคัญเลย' ~ 1,
    TRUE ~ NA_real_
  )
}

certain_score <- function(x) {
  case_when(
    x == 'ไม่มั่นใจ' ~ 4,
    x == 'ไม่ค่อยมั่นใจ' ~ 3,
    x == 'ค่อนข้างมั่นใจ' ~ 2,
    x == 'มั่นใจมาก' ~ 1,
    TRUE ~ NA_real_
  )
}

certain_score_rev <- function(x) {
  case_when(
    x == 'ไม่มั่นใจ' ~ 1,
    x == 'ไม่ค่อยมั่นใจ' ~ 2,
    x == 'ค่อนข้างมั่นใจ' ~ 3,
    x == 'มั่นใจมาก' ~ 4,
    TRUE ~ NA_real_
  )
}

confidence_score <- function(x) {
  case_when(
    x == 'ทำได้แน่นอน' ~ 4,
    x == 'คิดว่าทำได้' ~ 3,
    x == 'คิดว่าทำไม่ได้' ~ 2,
    x == 'ทำไม่ได้เลย' ~ 1,
    TRUE ~ NA_real_
  )
}
