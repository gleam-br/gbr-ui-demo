import gleam/list

import lustre/attribute as a
import lustre/element/html

import gbr/ui/admin/alert

pub fn alert_case() {
  let alert =
    alert.new("Test alert!", "Testing alert element by @gleam-br")
    |> alert.open(True)

  let alerts =
    [alert.success, alert.info, alert.warning, alert.error]
    |> list.map(fn(transform) {
      transform(alert)
      |> alert.at_link("#", "Learn more")
      |> alert.render()
    })

  [html.div([a.class("flex flex-col gap-2")], alerts)]
}
