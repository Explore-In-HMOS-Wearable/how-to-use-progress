import Timer from '../model/Timer'

@Component
export default struct Capsule {
  @ObjectLink timer: Timer;
  @State smoothEffect: boolean = false
  @State scanEffect: boolean = false
  @State showPercentage: boolean = false

  build() {
    Swiper() {
      RelativeContainer() {
        Column() {
          Text('Capsule')
          Blank().layoutWeight(1)
          Progress({
            type: ProgressType.Capsule,
            value: this.timer.progress,
            total: this.timer.goal,
          })
            .style({
              enableSmoothEffect: this.smoothEffect,
              enableScanEffect: this.scanEffect,
              showDefaultPercentage: this.showPercentage,
            })

            .size({ height: '20%' })
          Blank().layoutWeight(1)
        }
        .size({ width: '70%', height: '80%' })
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      }

      RelativeContainer() {
        Column() {
          Text('Capsule')
          Row() {
            Text('Smooth Effect')
            Blank().layoutWeight(1)
            Toggle({ type: ToggleType.Switch, isOn: $$this.smoothEffect })
          }

          Row() {
            Text('Scan Effect')
            Blank().layoutWeight(1)
            Toggle({ type: ToggleType.Switch, isOn: $$this.scanEffect })
          }

          Row() {
            Text('Percentage')
            Blank().layoutWeight(1)
            Toggle({ type: ToggleType.Switch, isOn: $$this.showPercentage })
          }
        }
        .size({ width: '70%', height: '80%' })
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      }
    }
    .loop(false)
    .effectMode(EdgeEffect.None)
  }
}