worry_score <- function(x) {
  case_when(
    x == 'Very worried' ~ 4,
    x == 'Somewhat worried' ~ 3,
    x == 'A little worried' ~ 2,
    x == 'Not at all worried' ~ 1,
    TRUE ~ NA_real_
  )
}

norm_score <- function(x) {
  case_when(
    x == 'No one' ~ 4,
    x == 'Some' ~ 3,
    x == 'Most' ~ 2,
    x == 'All' ~ 1,
    TRUE ~ NA_real_
  )
}

norm_score_rev <- function(x) {
  case_when(
    x == 'No one' ~ 1,
    x == 'Some' ~ 2,
    x == 'Most' ~ 3,
    x == 'All' ~ 4,
    TRUE ~ NA_real_
  )
}

