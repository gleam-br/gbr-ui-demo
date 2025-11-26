import gleam/list

import lustre/attribute as a
import lustre/element/html

import gbr/ui/svg
import gbr/ui/svg/alert
import gbr/ui/svg/form
import gbr/ui/svg/icons
import gbr/ui/svg/social
import gbr/ui/typo

pub fn svg_case() {
  [
    alert,
    form,
    social,
    icons,
  ]
  |> list.map(fn(show) {
    html.div([a.class("flex items-center gap-2")], show())
  })
}

pub fn alert() {
  render("Alert", [
    alert.info,
    alert.warning,
    alert.success,
  ])
}

pub fn form() {
  render("Form", [
    form.checkbox,
    form.email,
    form.eye_open,
    form.eye_close,
    form.search,
    form.success,
    form.info,
    form.alert,
    form.error,
  ])
}

pub fn social() {
  render("Social", [
    social.google,
    social.microsoft,
    social.twitter,
  ])
}

pub fn icons() {
  render("Icons", [
    icons.ai_assistent,
    icons.app_nav,
    icons.arrow,
    icons.back,
    icons.bell,
    icons.calendar,
    icons.close,
    icons.copy,
    icons.cross,
    icons.cube,
    icons.dashboard,
    icons.down,
    icons.sun,
    icons.support,
    icons.sign_out,
    icons.form,
    icons.greater,
    icons.hamburguer,
    icons.hamburguer_small,
    icons.list,
    icons.moon,
    icons.profile,
    icons.reticence,
    icons.search,
    icons.settings,
    icons.spinner,
  ])
}

fn render(title, transformers) {
  [
    typo.h4("SVG " <> title <> ": ")
      |> typo.class("text-lg text-gray-500 dark:text-gray-400")
      |> typo.render(),
    ..transformers
    |> list.map(fn(transform) {
      svg.new(26, 26)
      |> transform()
      |> svg.render()
    })
  ]
}
