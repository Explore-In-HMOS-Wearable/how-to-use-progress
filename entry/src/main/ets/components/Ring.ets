import Timer from '../model/Timer';
import { CounterComponent, CounterType } from '@kit.ArkUI';

@Component
export default struct Ring {
  @ObjectLink timer: Timer;
  private _purpleGradient: LinearGradient = new LinearGradient([
    { color: $r('app.color.purple_gradient_1'), offset: 0.2 },
    { color: $r('app.color.purple_gradient_2'), offset: 0.4 },
    { color: $r('app.color.purple_gradient_3'), offset: 0.6 },
    { color: $r('app.color.purple_gradient_4'), offset: 0.8 },
    { color: $r('app.color.purple_gradient_5'), offset: 1 }
  ])
  @State smoothEffect: boolean = false
  @State scanEffect: boolean = false
  @State statusProgressing: boolean = true
  @State status: ProgressStatus = ProgressStatus.PROGRESSING
  @State strokeWidth: number = 4

  build() {
    Swiper() {
      RelativeContainer() {
        Stack() {
          Progress({
            type: ProgressType.Ring,
            value: this.timer.progress,
            total: this.timer.goal,
          })
            .size({ width: '100%', height: '100%' })
            .color(this._purpleGradient)
            .style({
              enableSmoothEffect: this.smoothEffect,
              enableScanEffect: this.scanEffect,
              status: this.status,
              strokeWidth: this.strokeWidth,
            })

          Text('Ring')
        }
        .size({ width: '70%', height: '80%' })
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      }

      RelativeContainer() {
        Column() {
          Text('Ring')
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
            Text('Status')
            Blank().size({
              width: 8
            })
            Toggle({ type: ToggleType.Button, isOn: $$this.statusProgressing }) {
              Text(this.statusProgressing ? 'Progressing' : 'Loading')
                .fontSize(12)
            }
            .layoutWeight(1)
            .onChange((isOn: boolean) => {
              if (isOn) {
                this.status = ProgressStatus.PROGRESSING
              } else {
                this.status = ProgressStatus.LOADING
              }
            })
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