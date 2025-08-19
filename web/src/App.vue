<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useNuiEvent } from './utils/useNui'
import { usePlayerStatus } from './state/PlayerStatus'
import { useVehicleState } from './state/VehicleState'
import Hud from './components/Hud.vue'
import CarHud from './components/Carhud.vue'
const { status } = usePlayerStatus()
const { vehicleState } = useVehicleState()
const hideHuds = ref(false)

useNuiEvent<{ hide: boolean }>('hideHuds', (data) => {
  hideHuds.value = data.hide
})

onMounted(() => {
  console.log('App.vue mounted - Toggling Interface - NUI made by rk or @9zku')
})
</script>

<template>
  <div class="min-h-screen text-white flex items-center justify-center">
    <Transition
      enter-active-class="transition-all duration-300 ease-out"
      enter-from-class="opacity-0 transform translate-y-4"
      enter-to-class="opacity-100 transform translate-y-0"
      leave-active-class="transition-all duration-300 ease-in"
      leave-from-class="opacity-100 transform translate-y-0"
      leave-to-class="opacity-0 transform translate-y-4"
    >
      <Hud v-if="!hideHuds" :status="status" :vehicleState="vehicleState" />
    </Transition>
    <CarHud v-if="!hideHuds && vehicleState.isInVehicle" :vehicleState="vehicleState" />
  </div>
</template>

<style scoped>

</style>
