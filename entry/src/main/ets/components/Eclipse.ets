import Timer from '../model/Timer';

@Component
export default struct Eclipse {
  @ObjectLink timer: Timer;
  @State smoothEffect: boolean = false;

  build() {
    Swiper() {
      RelativeContainer() {
        Stack() {
          Progress({
            type: ProgressType.Eclipse,
            value: this.timer.progress,
            total: this.timer.goal
          })
            .size({ width: '100%', height: '100%' })
            .style({ enableSmoothEffect: this.smoothEffect });

          Text('Eclipse');
        }
        .size({ width: '70%', height: '80%' })
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        });
      };

      RelativeContainer() {
        Column() {
          Text('Eclipse');
          Row() {
            Text('Smooth Effect');
            Blank().layoutWeight(1);
            Toggle({ type: ToggleType.Switch, isOn: this.smoothEffect }).onChange((isOn) => {
              this.smoothEffect = isOn;
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