
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Govardhan Ummadisetty"
#let locale-catalog-page-numbering-style = context { "Govardhan Ummadisetty - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Jan 2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.4em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = false
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Source Sans 3"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = "|"
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  set text(fill: design-colors-connections)
  set par(leading: design-text-leading*1.7, justify: false)
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Govardhan Ummadisetty

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Banglore, KA],
  [#box(original-link("mailto:vardhank9@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)vardhank9\@gmail.com])],
  [#box(original-link("tel:+91-90144-20923")[#fa-icon("phone", size: 0.9em) #h(0.05cm)090144 20923])],
  [#box(original-link("https://linktr.ee/susmigo1210")[#fa-icon("link", size: 0.9em) #h(0.05cm)linktr.ee/susmigo1210])],
  [#box(original-link("https://linkedin.com/in/susmigo1210")[#fa-icon("linkedin", size: 0.9em) #h(0.05cm)susmigo1210])],
  [#box(original-link("https://github.com/susmigo1210")[#fa-icon("github", size: 0.9em) #h(0.05cm)susmigo1210])],
)
#connections(connections-list)



== Professional Summary

#one-col-entry(
  content: [Enthusiastic and meticulous QA Tester with over #[*3 years*] of experience in both #[*Manual and Automated testing*]. Demonstrated ability to identify and resolve bugs, enhance software quality, and streamline processes. Skilled in collaborating within Agile teams to ensure the delivery of top-notch software products. Continuously learning and adapting to new testing tools, methodologies, and industry trends to provide optimal testing solutions.]
)


== Experience

#two-col-entry(
  left-content: [
    #[*Infosys Limited*], Technology Analyst
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Built a tool using Appscript and Google Sheets to automate test reporting, saving significant time.],)
  ],
  right-content: [
    Banglore, KA

Oct 2024 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #[*Infosys Limited*], Senior Systems Engineer
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Automated few test cases for TV using Python and UI Automator, reducing testing effort by 40\%.],[Developed a Python script to set up test environments, reducing setup time by 30\% and streamlining ADB command usage.],[Trained and deployed AI models to predict relevant hotlists for issues, reducing the effort of bug triagers by 50\% and improving issue-tracking efficiency.],)
  ],
  right-content: [
    Banglore, KA

Jan 2023 – Oct 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #[*Infosys Limited*], Systems Engineer
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Conducted regression, smoke, and performance testing on both client and server-side for Google TV and Android TV, ensuring compliance with product requirements.],[Streamlined testing processes by shortening lengthy ADB commands using Bash, ZSH scripting, and unbricking test devices, with comprehensive documentation for team use.],[Innovated and documented a VPN setup in the router to facilitate cross-border testing,  improving bandwidth by 80\% compared to traditional methods and eliminating geo-restriction constraints.],[Designed templates to provide developers with required test data and included logcat outputs and error details for efficient debugging.],[Analyzed product requirement documents \(PRD\) to plan and design comprehensive test suites, enhancing test coverage and quality assurance.],)
  ],
  right-content: [
    Banglore, KA

Dec 2021 – Jan 2023
  ],
)



== Education

// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#[*BTECH*]],
  middle-content: [
    #[*YSR Engineering of Yogi Vemana University*], Electrical & Electronics Engg
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Worked on #link("https://www.nfedconferences.org/proceedings/IC-GRPETHR\%202021.pdf\#page=57")[Solar MPPT \(Maximum Power Point Tracking\)] using CNN.],[Worked as a part-time tester for Custom Rom android builds \(AOSP\).],)
  ],
  right-content: [
    Proddatur, AP

July 2018 – Sept 2021
  ],
)



== Projects

#two-col-entry(
  left-content: [
    #[*Google TV & Android TV Testing*]
  ],
  right-content: [
    April-2022 -- present
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([#[*Client*]: Google],[#[*Role*]: QA Tester],[#[*Responsibilities*]: Conducted regression, smoke, and performance testing on both client and server side for Google TV, Android TV, and Google TV mobile.],[Validated features such as Continue Watching, Gemini Integration, and Google Assistant & Search.],[#[*Devices Tested*]: Google Chromecast 4K, Chromecast HD, Google TV Streamer, and Panel TVs like Sony, Hisense, and TCL.],)
  ],
)



== Tools Created \(other Projects\)

#two-col-entry(
  left-content: [
    #[*Go Command Line Interface \(GoCLI\)*]
  ],
  right-content: [
    #link("https://susmigo1210.github.io/gocli_guide/")[github.com/susmigo1210/gocli]
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Built using Python, Which helps the QA Testers in filing bugs and adding comments. Reduced the bug logging time by 60\%.],[Automatically collects the test data like bug reports, screenshots, and logcat which are required by the developers for debugging.],[#[*Supported Form Factors:*] Phone, TV, Tablet, and Watch],[#[*Tools Used:*] Python, shell scripting],)
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #[*Bug Report Extractor*]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Created with Python, which parses the raw bug report and generates a new file with device details like build info, a list of packages with version names, and version code in a pretty tabular format.],)
  ],
)



== Skills

#one-col-entry(
  content: [#[*Hard Skills:*] Manual & Automation testing, Log Monitoring and Analysis, Automating repetitive tasks.]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#[*Soft Skills:*] Attention to Detail, Problem-Solving, Communication Skills, Team Collaboration, Time Management, Adaptability & Proactive Mindset.]
)


== Technologies

#one-col-entry(
  content: [#[*OS:*] Mac OS, Linux, Windows.]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#[*Tools:*] Android Flash tool, QPST, Issue Tracker, Google Workspace.]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#[*Languages:*] Python, Javascript, Appscript.]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#[*Frameworks:*] UI Automator, Typer, Flet.]
)


== Awards & Recognization

#one-col-entry(
  content: [- #link("https://media.licdn.com/dms/image/v2/D5622AQEA64bWlBwoig/feedshare-shrink_1280/feedshare-shrink_1280/0/1717684202883?e=1737590400&v=beta&t=W4KZ_pPUkMEDnSMrJRxHFqpt7-938ofG43Ub-g3rlz8")[RnR Award 2024 from Infosys]. For Developing the QA Assistant tool #[*GoCli*].],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #link("https://media.licdn.com/dms/image/v2/D5622AQF6D1znOZFBqw/feedshare-shrink_2048_1536/feedshare-shrink_2048_1536/0/1712853041179?e=1737590400&v=beta&t=KZFeMril86E8BwjlAOnaFXRJV_LUO2CByhGHJC6Z35Y")[RISE Award 2023 from Infosys]. Recognized for creating the VPN setup.],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #link("https://media.licdn.com/dms/image/v2/D5622AQF3kXcN1EZ9yA/feedshare-shrink_2048_1536/feedshare-shrink_2048_1536/0/1684258474806?e=1737590400&v=beta&t=m-fkwha-bnBCg_boQJ4Lfdsi8VQKByiYz4B5Jm4329o")[Insta Award 2023 from Infosys]. Recognized for documenting the server side setup and Testing Process.],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- #link("https://media.licdn.com/dms/image/v2/C5622AQGmS4TywZYO7Q/feedshare-shrink_1280/feedshare-shrink_1280/0/1669996323050?e=1737590400&v=beta&t=4lxGJdI1SJRUydLBf9mb0Z3w78_o66TZCvytgSi18MI")[Insta Award 2022 from Infosys]. For writing the script to set up test environments.],
)


== Hobbies & Interests

#one-col-entry(
  content: [- Building Tools and writing scripts using Python.],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Reading Dev articles and tutorials.],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Being an Audiophile.],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- Playing Desktop & Playstation games.],
)


