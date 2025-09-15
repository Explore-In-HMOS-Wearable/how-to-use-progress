import Capsule from '../components/Capsule';
import Eclipse from '../components/Eclipse';
import Linear from '../components/Linear'
import Ring from '../components/Ring';
import ScaleRing from '../components/ScaleRing';
import Timer from '../model/Timer'

@Entry
@Component
struct Index {
  @State timer: Timer = new Timer();

  aboutToAppear(): void {
    this.timer.start()
  }

  build() {
    Swiper() {
      Linear({ timer: this.timer })

      Capsule({ timer: this.timer })

      Ring({ timer: this.timer })

      ScaleRing({ timer: this.timer })

      Eclipse({ timer: this.timer })
    }
    .loop(false)
    .vertical(true)
    .effectMode(EdgeEffect.None)
  }
}