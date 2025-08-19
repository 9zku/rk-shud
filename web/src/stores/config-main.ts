import { ref } from 'vue'
import { useNuiEvent } from '../utils/useNui'
import type { Config } from '../types'

const config = ref<Config>({
  framework: 'standalone',
  commands: {
    hide: 'hidehud',
    show: 'showhud'
  },
  features: {
    hunger: true,
    thirst: true,
    armour: true,
    stamina: true
  }
})

export function useConfig() {
  useNuiEvent<Config>('updateConfig', (data) => {
    config.value = data
    
    if (data.framework === 'standalone') {
      config.value.features.hunger = false
      config.value.features.thirst = false
    }
  })

  return {
    config: config
  }
}
