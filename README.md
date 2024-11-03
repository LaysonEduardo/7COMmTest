# 7COMm Test

## Decisões de uso (Packages)

Com base na descrição do teste/task essas foram as decisões tomadas quanto aos packages
    
 - UI
    - flutter_svg: Utilizar as imagens em vetor para evitar perca de qualidade.
    - flutter_otp_text_field: Componente para input de código OTP. (Para agilizar o desenvolvimento)
   ---

 - Dependecy Injection/Navegation
    - flutter_modular: Modularizar o projeto para facilitar a manutenção e reutilização de código, facilitar a navegação de telas e injetar dependências.
   ---
 - State Management 
    - flutter_bloc (Requisito obrigatório)
   ---
 - HTTP
    - dio (Para demonstrar a implementação de services independentes).
   ---