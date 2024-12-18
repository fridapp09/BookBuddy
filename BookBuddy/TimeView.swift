//
//  TimeView.swift
//  BookBuddy
//
//  Created by Frida Pérez Perfecto on 10/12/24.
//

import SwiftUI

struct TimeView: View {
    @State private var timerRunning = false
    @State private var timeElapsed: TimeInterval = 0
    @State private var timer: Timer? = nil
    
    // Tiempo máximo (en segundos)
    private let maxTime: TimeInterval = 60 * 60 // 1 hora

    var body: some View {
        VStack {
            Spacer()

            // Título
            Text("Time to read!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
                .padding(.bottom, 40)

            // Círculo de progreso
            ZStack {
                // Fondo del círculo
                Circle()
                    .stroke(lineWidth: 15)
                    .foregroundColor(.gray.opacity(0.3))

                // Progreso del círculo
                Circle()
                    .trim(from: 0, to: CGFloat(timeElapsed / maxTime))
                    .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round))
                    .foregroundColor(.blue)
                    .rotationEffect(.degrees(-90))

                // Tiempo en números grandes, sin letras
                Text("\(formattedTime())")
                    .font(.system(size: 64, weight: .bold, design: .monospaced))
                    .foregroundColor(.primary)
            }
            .frame(width: 300, height: 300)
            .padding(.bottom, 40)

            // Botones de control
            HStack(spacing: 20) {
                Button(action: {
                    if timerRunning {
                        stopTimer()
                    } else {
                        startTimer()
                    }
                }) {
                    Text(timerRunning ? "Pausar" : "Iniciar")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(timerRunning ? Color.orange : Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }

                Button(action: resetTimer) {
                    Text("Reiniciar")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .navigationTitle("Temporizador")
        .navigationBarTitleDisplayMode(.inline)
    }

    // Método para formatear el tiempo (solo números)
    private func formattedTime() -> String {
        let minutes = Int(timeElapsed) / 60
        let seconds = Int(timeElapsed) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    // Métodos del temporizador
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeElapsed < maxTime {
                timeElapsed += 1
            }
        }
        timerRunning = true
    }

    private func stopTimer() {
        timer?.invalidate()
        timerRunning = false
    }

    private func resetTimer() {
        timer?.invalidate()
        timer = nil
        timeElapsed = 0
        timerRunning = false
    }
}

#Preview {
    TimeView()
}
