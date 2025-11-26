////
////
////

import gbr/ui/admin/header
import gbr/ui/admin/user
import gbr/ui/admin/user/dropdown
import gbr/ui/logo
import gbr/ui/svg/icons
import gbr/ui/typo

pub fn header() {
  let logo = logo()
  let user = user()
  let header =
    header.new("header-id")
    |> header.logo(logo)
    |> header.user(user)
  #(header, logo)
}

fn logo() {
  logo.new("#")
  |> logo.src("/gleam/logo-icon.png")
  |> logo.src_dark("/gleam/logo-icon.png")
  |> logo.icon("/gleam/logo-icon.png")
  |> logo.alt("Logo")
  |> logo.text(text_gleambr())
  |> logo.class("logo")
  |> logo.class_small("logo-icon")
  |> logo.class_content("flex gap-2 items-center")
}

fn user() {
  user.new("html-user-id", "contato.gleam-br")
  |> user.email("contato@gleam-br.dev.br")
  |> user.department("GTSUP")
  |> user.name_full("Contato Gleam BR")
  |> user.picture("/gleam/perfil.jpeg")
  |> user.dropdown(
    dropdown.new(False)
    |> dropdown.add_menu_icon("user-01", "User 01", icons.profile)
    |> dropdown.add_menu_icon("user-02", "User 02", icons.settings)
    |> dropdown.add_menu_icon("user-03", "User 03", icons.support),
  )
}

fn text_gleambr() {
  let gleam =
    typo.span("Gleam")
    |> typo.class("text-title-lg text-orange-700 dark:text-orange-100")

  let br =
    typo.span("br")
    |> typo.class("text-title-sm text-green-800 dark:text-green-300")

  [gleam, br]
}
