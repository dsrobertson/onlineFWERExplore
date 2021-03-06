################################################################################
# UI modules
#
# Author: Lathan Liou
# Created: Wed Dec 16 12:02:10 2020 ------------------------------
################################################################################

#### ALGORITHM INPUT UI ####
ADDIS_spending_UI <- function(id) {
  ns <- NS(id)
  
  tagList(
    useShinyFeedback(),
    useShinyjs(),
    div(style = "display: inline-block;vertical-align:top; width: 200px;",
        strong("Alpha:"),
        shiny::textInput(ns("alpha"), 
                         NULL,
                         width = 80, value = 0.05, placeholder = ".05")),
    shinyBS::bsTooltip(ns("alpha"),
                       "Overall significance level of the FDR procedure",
                       placement = "right",
                       trigger = "hover"),
    div(style="display: inline-block;vertical-align:top; width: 200px;",
        strong(HTML(paste("Click for advanced options"))),
        prettyCheckbox(ns("checkbox"),
                       "Show me",
                       value = FALSE,
                       shape = "curve",
                       fill = TRUE,
                       animation = "pulse",
                       icon = icon("check"),
                       status = "info")
    ),
    shinyjs::hidden(
      div(
        id = ns("advopt"),
        div(style="display: inline-block;vertical-align:top; width: 200px;",
            tags$strong("Lambda:"),
            shiny::textInput(ns("lambda"), NULL, width = 80, value = 0.25, placeholder = ".25"),
            shinyBS::bsTooltip(ns("lambda"),
                               "Optional threshold for a candidate hypothesis",
                               placement = "right",
                               trigger = "hover")),
        div(style="display: inline-block;vertical-align:top; width: 200px;",
            tags$strong("Tau:"),
            shiny::textInput(ns("tau"), NULL, width = 80, value = 0.5, placeholder = ".5"),
            shinyBS::bsTooltip(ns("tau"),
                               "Optional threshold for selected hypotheses",
                               placement = "right",
                               trigger = "hover")),
        div(style="display: inline-block;vertical-align:top; width: 200px;",
            tags$strong(id = ns("label_dep"),
                        "Dependent:"),
            shinyWidgets::switchInput(ns("dep"), 
                                      NULL,
                                      value = FALSE,
                                      onLabel = "True",
                                      offLabel = "False",
                                      width = "80px")
        ),
        shinyBS::bsTooltip(ns("label_dep"),
                           "Your p-values are dependent.",
                           placement = "right",
                           trigger = "hover"),
        div(style="display: inline-block;vertical-align:top; width: 200px;",
            tags$strong(id = ns("label_bound"),
                        "Bound:"),
            shinyWidgets::switchInput(ns("algbound"), 
                                      NULL, 
                                      value = FALSE,
                                      onLabel = "True",
                                      offLabel = "False",
                                      width = "80px"),
            shinyBS::bsTooltip(ns("label_bound"),
                               "The default unbounded uses the number of p-values in your data. Setting bound to TRUE will allow you to set an upper bound for the number of hypotheses.",
                               placement = "right",
                               trigger = "hover")
        ),
        
        shinyjs::hidden(
          div(
            id = ns("boundtoggle"),
            div(style="display: inline-block;vertical-align:top; width: 200px;",
                tags$strong("Number of hypotheses"),
                shiny::textInput(ns("boundnum"),
                                 NULL,
                                 value = 100,
                                 placeholder = "No bound",
                                 width = 80))
          )
        )
      ) #close div
    ), #close div
    shinyWidgets::actionBttn(
      inputId = ns("go"),
      label = "Calculate", 
      style = "fill",
      color = "success"
    ),
    br(),
    br(),
    shinyWidgets::actionBttn(
      inputId = ns("reset"),
      label = "Reset Inputs",
      style = "fill",
      color = "success"
    )
  )
}

Alpha_spending_UI <- function(id) {
  ns <- NS(id)
  
  tagList(
    useShinyFeedback(),
    useShinyjs(),
    div(style = "display: inline-block;vertical-align:top; width: 200px;",
        strong("Alpha:"),
        shiny::textInput(ns("alpha"), 
                         NULL,
                         width = 80, value = 0.05, placeholder = ".05")),
    shinyBS::bsTooltip(ns("alpha"),
                       "Overall significance level of the FDR procedure",
                       placement = "right",
                       trigger = "hover"),
    shiny::textInput(ns("seed"), 
                     "Seed:",
                     width = 80, value = 1),
    shinyBS::bsTooltip(ns("seed"),
                       "Remember your number as this will let you access the same results in the future.",
                       placement = "right",
                       trigger = "hover"),
    div(style="display: inline-block;vertical-align:top; width: 200px;",
        strong(HTML(paste("Click for advanced options"))),
        prettyCheckbox(ns("checkbox"),
                       "Show me",
                       value = FALSE,
                       shape = "curve",
                       fill = TRUE,
                       animation = "pulse",
                       icon = icon("check"),
                       status = "info")
    ),
    shinyjs::hidden(
      div(
        id = ns("advopt"),
        div(style="display: inline-block;vertical-align:top; width: 200px;",
            tags$strong(id = ns("label_random"),
                        "Random:"),
            shinyWidgets::switchInput(ns("random"), 
                                      NULL,
                                      value = TRUE,
                                      onLabel = "True",
                                      offLabel = "False",
                                      width = "80px")
        ),
        shinyBS::bsTooltip(ns("label_random"),
                           "The order of p-values in each batch is randomized.",
                           placement = "right",
                           trigger = "hover"),
        div(style="display: inline-block;vertical-align:top; width: 200px;",
            tags$strong(id = ns("label_bound"),
                        "Bound:"),
            shinyWidgets::switchInput(ns("algbound"), 
                                      NULL, 
                                      value = FALSE,
                                      onLabel = "True",
                                      offLabel = "False",
                                      width = "80px"),
            shinyBS::bsTooltip(ns("label_bound"),
                               "The default unbounded uses the number of p-values in your data. Setting bound to TRUE will allow you to set an upper bound for the number of hypotheses.",
                               placement = "right",
                               trigger = "hover")
        ),
        
        shinyjs::hidden(
          div(
            id = ns("boundtoggle"),
            div(style="display: inline-block;vertical-align:top; width: 200px;",
                tags$strong("Number of hypotheses"),
                shiny::textInput(ns("boundnum"),
                                 NULL,
                                 value = 100,
                                 placeholder = "No bound",
                                 width = 80))
          )
        )
      ) #close div
    ),
    shinyWidgets::actionBttn(
      inputId = ns("go"),
      label = "Calculate", 
      style = "fill",
      color = "success"
    ),
    br(),
    br(),
    shinyWidgets::actionBttn(
      inputId = ns("reset"),
      label = "Reset Inputs",
      style = "fill",
      color = "success"
    )
  )
}

online_fallback_UI <- function(id) {
  ns <- NS(id)
  
  tagList(
    useShinyFeedback(),
    useShinyjs(),
    div(style = "display: inline-block;vertical-align:top; width: 200px;",
        strong("Alpha:"),
        shiny::textInput(ns("alpha"), 
                         NULL,
                         width = 80, value = 0.05, placeholder = ".05")),
    shinyBS::bsTooltip(ns("alpha"),
                       "Overall significance level of the FDR procedure",
                       placement = "right",
                       trigger = "hover"),
    shiny::textInput(ns("seed"), 
                     "Seed:",
                     width = 80, value = 1),
    shinyBS::bsTooltip(ns("seed"),
                       "Remember your number as this will let you access the same results in the future.",
                       placement = "right",
                       trigger = "hover"),
    div(style="display: inline-block;vertical-align:top; width: 200px;",
        strong(HTML(paste("Click for advanced options"))),
        prettyCheckbox(ns("checkbox"),
                       "Show me",
                       value = FALSE,
                       shape = "curve",
                       fill = TRUE,
                       animation = "pulse",
                       icon = icon("check"),
                       status = "info")
    ),
    shinyjs::hidden(
      div(
        id = ns("advopt"),
        div(style="display: inline-block;vertical-align:top; width: 200px;",
            tags$strong(id = ns("label_random"),
                        "Random:"),
            shinyWidgets::switchInput(ns("random"), 
                                      NULL,
                                      value = TRUE,
                                      onLabel = "True",
                                      offLabel = "False",
                                      width = "80px")
        ),
        shinyBS::bsTooltip(ns("label_random"),
                           "The order of p-values in each batch is randomized.",
                           placement = "right",
                           trigger = "hover"),
        div(style="display: inline-block;vertical-align:top; width: 200px;",
            tags$strong(id = ns("label_bound"),
                        "Bound:"),
            shinyWidgets::switchInput(ns("algbound"), 
                                      NULL, 
                                      value = FALSE,
                                      onLabel = "True",
                                      offLabel = "False",
                                      width = "80px"),
            shinyBS::bsTooltip(ns("label_bound"),
                               "The default unbounded uses the number of p-values in your data. Setting bound to TRUE will allow you to set an upper bound for the number of hypotheses.",
                               placement = "right",
                               trigger = "hover")
        ),
        
        shinyjs::hidden(
          div(
            id = ns("boundtoggle"),
            div(style="display: inline-block;vertical-align:top; width: 200px;",
                tags$strong("Number of hypotheses"),
                shiny::textInput(ns("boundnum"),
                                 NULL,
                                 value = 100,
                                 placeholder = "No bound",
                                 width = 80))
          )
        )
      ) #close div
    ),
    shinyWidgets::actionBttn(
      inputId = ns("go"),
      label = "Calculate", 
      style = "fill",
      color = "success"
    ),
    br(),
    br(),
    shinyWidgets::actionBttn(
      inputId = ns("reset"),
      label = "Reset Inputs",
      style = "fill",
      color = "success"
    )
  )
}

#### OTHER UI ####
tableUI <- function(id) {
  ns <- NS(id)
  
  reactableOutput(ns("table")) %>%
    shinycssloaders::withSpinner(type = 6,
                                 color = "#0066CC")
}

summaryUI <- function(id) {
  ns <- NS(id)
  tagList(
    useShinyjs(),
    shinyjs::hidden(
      div(
        id = ns("downloadbutton"),
        uiOutput(ns("count"))
      ) #close div
    )
  )
}

compareUI <- function(id) {
  ns <- NS(id)
  
  tagList(
    br(),
    p("To use this feature, first click 'Reset Inputs'. Make sure you have already clicked 'Calculate'. This feature compares the results of two algorithms at their default settings. Changing any inputs will result in an unfair and nonsensical comparison. Note that for datasets with more than 50,000 p-values, expect a runtime between 30 seconds and 1 minute."),
    column(width = 12,
           align = "center",
           div(style = "display: inline-block;vertical-align:top;text-align:center",
               strong("Pick an algorithm for comparison"),
               shiny::selectInput(ns("alg"), NULL, c("ADDIS_spending","Alpha_spending", "Online_fallback")))),
    shinyWidgets::actionBttn(
      inputId = ns("compare"),
      label = "Compare",
      style = "fill",
      color = "primary"
    ),
    br(),
    plotlyOutput(ns("comp")) %>%
      shinycssloaders::withSpinner(type = 6,
                                   color = "#0066CC"),
    br(),
    uiOutput(ns("compnum"))
  ) #close taglist
}

plotUI <- function(id) {
  ns <- NS(id)
  
  tagList(
    plotlyOutput(ns("plot")) %>%
      shinycssloaders::withSpinner(type = 6,
                                   color = "#0066CC"),
    br(),
    uiOutput(ns("num"))
  )
  
}

set_html_breaks <- function(n) {
  HTML(strrep(br(), n))
}

placeholderUI <- function(id) {
  ns <- NS(id)
  fluidRow(
    p(id = ns("placeholder"), 
      set_html_breaks(10),
      "Nothing calculated yet",
      style = "text-align: center;
    vertical-align: middle;
    font-family: Lato, sans-serif;
    font-size: 18px")
  )
}

placeholder2UI <- function(id) {
  ns <- NS(id)
  fluidRow(
    p(id = ns("placeholder2"), 
      set_html_breaks(10),
      "Nothing calculated yet",
      style = "text-align: center;
    vertical-align: middle;
    font-family: Lato, sans-serif;
    font-size: 18px")
  )
}