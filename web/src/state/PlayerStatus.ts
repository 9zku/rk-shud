import { ref, computed } from 'vue'
import { useNuiEvent } from '../utils/useNui'
import type { PlayerStatus } from '../types'

const status = ref<PlayerStatus>({
  health: 100,
  armour: 100,
  hunger: 100,
  thirst: 100,
  stamina: 100
})

export function usePlayerStatus() {
  useNuiEvent<PlayerStatus>('updatePlayerStatus', (data) => {
    status.value = data
  })

  return {
    status: computed(() => status.value)
  }
}
