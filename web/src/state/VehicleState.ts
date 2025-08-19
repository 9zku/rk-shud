import { ref, computed } from 'vue'
import { useNuiEvent } from '../utils/useNui'
import type { VehicleState } from '../types'

const vehicleState = ref<VehicleState>({
  health: 50,
  rpm: 80,
  fuel: 75,
  seatbelt: true,
  speed: 0,
  isInVehicle: false
})

export function useVehicleState() {
  useNuiEvent<VehicleState>('updateVehicleState', (data) => {
    vehicleState.value = { ...vehicleState.value, ...data }
  })

  const setVehicleHealth = (health: number): void => {
    vehicleState.value.health = health
  }

  const setVehicleRPM = (rpm: number): void => {
    vehicleState.value.rpm = rpm
  }

  const setVehicleFuel = (fuel: number): void => {
    vehicleState.value.fuel = fuel
  }

  const setVehicleSeatbelt = (seatbelt: boolean): void => {
    vehicleState.value.seatbelt = seatbelt
  }

  const setVehicleSpeed = (speed: number): void => {
    vehicleState.value.speed = speed
  }

  const setIsInVehicle = (inVehicle: boolean): void => {
    vehicleState.value.isInVehicle = inVehicle
  }

  const getVehicleHealth = (): number => {
    return vehicleState.value.health
  }

  const getVehicleRPM = (): number => {
    return vehicleState.value.rpm
  }

  const getVehicleFuel = (): number => {
    return vehicleState.value.fuel
  }

  const getVehicleSeatbelt = (): boolean => {
    return vehicleState.value.seatbelt
  }

  const getVehicleSpeed = (): number => {
    return vehicleState.value.speed
  }

  const getIsInVehicle = (): boolean => {
    return vehicleState.value.isInVehicle
  }

  return {
    vehicleState: computed(() => vehicleState.value),
    setVehicleHealth,
    setVehicleRPM,
    setVehicleFuel,
    setVehicleSeatbelt,
    setVehicleSpeed,
    setIsInVehicle,
    getVehicleHealth,
    getVehicleRPM,
    getVehicleFuel,
    getVehicleSeatbelt,
    getVehicleSpeed,
    getIsInVehicle
  }
}
