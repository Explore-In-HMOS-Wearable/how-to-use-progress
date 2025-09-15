import Timer from '../model/Timer';
import { CounterComponent, CounterType } from '@kit.ArkUI';

@Component
export default struct Linear {
  @ObjectLink timer: Timer;
  // controls
  @State smoothEffect: boolean = false
  @State scanEffect: boolean = false
  @State strokeWidth: number = 4

  build() {
    Swiper() {
      RelativeContainer() {
        Column() {
          Text('Linear')
          Blank().layoutWeight(1)
          Progress({
            type: ProgressType.Linear,
            value: this.timer.progress,
            total: this.timer.goal,
          })
            .style({
              enableSmoothEffect: this.smoothEffect,
              enableScanEffect: this.scanEffect,
              strokeWidth: this.strokeWidth,
            })
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
          Text('Linear')

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
            Text('Width')
            Blank().layoutWeight(1)
            CounterComponent({
              options: {
                type: CounterType.COMPACT,
                numberOptions: {
                  value: this.strokeWidth,
                  min: 1,
                  max: 25,
                  focusable: false,
                  onChange: (val: number) => {
                    this.strokeWidth = val
                  }
                },
              }
            })
          }
          .alignItems(VerticalAlign.Center)
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