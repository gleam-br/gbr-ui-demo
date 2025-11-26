////
////
////

import gleam/list
import gleam/option.{Some}

import lustre
import lustre/attribute as a
import lustre/effect
import lustre/element/html

import dark_mode

import gbr/ui
import gbr/ui/admin/header
import gbr/ui/admin/sidebar
import gbr/ui/admin/sidebar/menu

import showcase/alert_show
import showcase/header_show
import showcase/sidebar_show
import showcase/svg_show

pub fn main() -> Nil {
  let assert Ok(_runtime) =
    lustre.application(init, update, view)
    |> lustre.start("body", Nil)

  Nil
}

type Model {
  Model(header: header.UIHeader, sidebar: sidebar.UISidebar)
}

type Msg {
  OnClick(String, menu.UISidebarMenu)
  OnDarkMode
  OnSidebar
  OnAppMobile
  OnUserDropdown
  OnUserSubmit(String)
}

fn init(_) {
  let assert Ok(_) = dark_mode.from_media()

  let #(header, logo) = header_show.header()
  let sidebar = sidebar_show.sidebar(logo)

  #(Model(header:, sidebar:), effect.none())
}

fn update(m: Model, msg: Msg) {
  let Model(sidebar:, header:) = m

  case msg {
    OnUserDropdown -> {
      let header = header.toggle_dropdown(header)
      #(Model(..m, header:), effect.none())
    }
    OnUserSubmit(id) -> {
      echo "USER ONSUBMIT"
      echo id

      #(m, effect.none())
    }
    OnAppMobile -> {
      let header = header.toggle_mobile(header)

      #(Model(..m, header:), effect.none())
    }
    OnSidebar -> {
      let sidebar = sidebar.toggle(sidebar)
      let header = header.toggle_sidebar(header)

      #(Model(sidebar:, header:), effect.none())
    }
    OnDarkMode -> {
      let assert Ok(_) = dark_mode.toggle(False)

      #(m, effect.none())
    }
    OnClick(id, menu) -> {
      let sidebar = sidebar.selected(sidebar, id, menu)

      #(Model(..m, sidebar:), effect.none())
    }
  }
}

fn view(m: Model) {
  let Model(header:, sidebar:) = m

  let header =
    header.at(header)
    |> header.on_darkmode(OnDarkMode)
    |> header.on_sidebar(OnSidebar)
    |> header.on_dropdown(OnUserDropdown)
    |> header.on_mobile(OnAppMobile)
    |> header.on_submit(OnUserSubmit)
    |> header.render()

  let sidebar =
    sidebar.at(sidebar, OnClick)
    |> sidebar.render()

  ui.primary(header:, sidebar:, content: Some(show_case()))
}

fn show_case() {
  html.div(
    [
      a.class("mx-auto max-w-(--breakpoint-2xl) p-4 pb-20 md:p-6 md:pb-6"),
    ],
    list.append(alert_show.alert_case(), svg_show.svg_case()),
  )
}
