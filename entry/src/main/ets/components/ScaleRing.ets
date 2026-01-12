import Timer from '../model/Timer';
import { CounterComponent, CounterType } from '@kit.ArkUI';

@Component
export default struct ScaleRing {
  @ObjectLink timer: Timer;
  @State smoothEffect: boolean = false;
  @State strokeWidth: number = 4;
  @State scaleCount: number = 120;

  build() {
    Swiper() {
      RelativeContainer() {
        Stack() {
          Progress({
            type: ProgressType.ScaleRing,
            value: this.timer.progress,
            total: this.timer.goal
          })
            .size({ width: '100%', height: '100%' })
            .style({
              enableSmoothEffect: this.smoothEffect,
              strokeWidth: this.strokeWidth,
              scaleCount: this.scaleCount
            });

          Text('Scale Ring');
        }
        .size({ width: '70%', height: '80%' })
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        });
      };

      RelativeContainer() {
        Column() {
          Text('Scale Ring');
          Row() {
            Text('Smooth Effect');
            Blank().layoutWeight(1);
            Toggle({ type: ToggleType.Switch, isOn: this.smoothEffect }).onChange((isOn) => {
              this.smoothEffect = isOn;
            });
          };

          Column() {
            Text('Width');
            CounterComponent({
              options: {
                type: CounterType.COMPACT,
                numberOptions: {
                  value: this.strokeWidth,
                  min: 1,
                  max: 25,
                  focusable: false,
                  onChange: (val: number) => {
                    this.strokeWidth = val;
                  }
                }
              }
            });
          };

          Column() {
            Text('Scale Count');
            CounterComponent({
              options: {
                type: CounterType.COMPACT,
                numberOptions: {
                  value: this.scaleCount,
                  min: 60,
                  max: 150,
                  step: 10,
                  focusable: false,
                  onChange: (val: number) => {
                    this.scaleCount = val;
                  }
                }
              }
            });
          };
        }
        .size({ width: '70%', height: '80%' })
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        });
      };
    }
    .loop(false)
    .effectMode(EdgeEffect.None);
  }
}